{-# LANGUAGE OverloadedStrings #-}

module Main where

import System.ZMQ4.Monadic
import Control.Monad
import Data.List.NonEmpty (fromList)
import Data.ByteString

respond :: [ByteString] -> [ByteString]
respond ("ping":_) = ["pong"]
respond ("reset":_) = ["reset:ok"]
respond ("iterate":a) = ["result", "C"]
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
