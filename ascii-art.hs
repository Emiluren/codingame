import System.IO
import Control.Monad

getAsciiLines :: Int -> IO [String]
getAsciiLines 0 = return []
getAsciiLines n = do
    row <- getLine
    otherRows <- getAsciiLines $ n - 1
    return row : otherRows
    
alphabet :: String
alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ?"

partition :: [a] -> [[a]]
partition _ [] = []
partition n xs =
    map (take n) xs : letterPatterns w $ map (drop w) xs

pickElements :: [Int] -> [a] -> [a]
pickElements [] _ = []
pickElements i:is xs =
    (i !! xs) : pickElements xs

main :: IO ()
main = do
    hSetBuffering stdout NoBuffering -- DO NOT REMOVE
    
    letterWidth <- fmap read getLine :: IO Int
    letterHeight <- fmap read getLine :: IO Int
    text <- getLine
    
    lines <- getAsciiLines letterHeight
    
    -- hPutStrLn stderr "Debug messages..."
    
    -- Write answer to stdout
    putStrLn "answer"
    return ()
