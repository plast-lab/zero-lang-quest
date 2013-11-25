import Data.Map (fromListWith, (!))
import Data.Set (union, singleton, size)
import Data.Text (pack, unpack, split)
import System.Environment

type Pair = (Int, Int)

parseInt x = read x::Int

parse :: String -> Pair
parse = tuplify . map (parseInt . unpack) . split (=='|') . pack
        where tuplify [x,y] = (x,y)

unparse :: Pair -> String
unparse (x,y) = show x ++ "|" ++ show y

multipair :: Int -> [String] -> [String]
multipair k lines = let pairs    = map parse lines
                        tr (x,y) = (y, singleton x)
                        invmap   = fromListWith union $ map tr pairs
                        oc (_,y) = (>=k) $ size $ invmap ! y
                     in map unparse $ filter oc pairs
main = do
  args <- getArgs
  let n = parseInt $ head args 
   in interact $ unlines . multipair n . lines
