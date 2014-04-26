{-# LANGUAGE OverloadedStrings #-}

module Main where

import System.ZMQ4.Monadic
import Control.Monad
import Data.List.NonEmpty (fromList)

respond ("ping":_) = ["pong"]
respond ("reset":_) = ["ok"]
respond ("iterate":a) = ["C"]
respond _ = ["error"]

main :: IO ()
main =
    runZMQ $ do
        requester <- socket Req
        connect requester "tcp://localhost:1441"

        sendMulti requester (fromList ["reg", "hs:sample"])

        forever $ do
          msg <- receiveMulti requester
          sendMulti requester (fromList (respond msg))
