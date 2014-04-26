{-# LANGUAGE OverloadedStrings #-}

module Main where

import System.ZMQ4.Monadic
import Data.List.NonEmpty (fromList)
import Control.Monad
import Data.ByteString.Char8 (unpack)
import Text.Printf

main :: IO ()
main =
    runZMQ $ do
        requester <- socket Req
        connect requester "tcp://localhost:1441"

        sendMulti requester (fromList ["reg", "hs:test:1"])

        msg <- receiveMulti requester
        liftIO $ printf "Received reply %s\n" (unpack (head msg))
