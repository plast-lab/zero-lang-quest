import Data.Map (Map, fromListWith, (!))
import Data.Set (Set, union, singleton, size)
import Data.List.Split
import System.Environment

tuplify2 [x,y] = (x,y)

pipeline k (x:xs) = let parseLine = tuplify2 . map (\x -> read x::Integer) . splitOn "|"
                        trans = (\(x,y) -> (y, singleton x)) . parseLine
                        m = (fromListWith union . map trans) (x:xs)
                    in filter (\z -> (size (m ! (snd . parseLine) z) >= k)) (x:xs)

main = do
  args <- getArgs
  interact $ unlines. pipeline (read (head args)::Int). lines
