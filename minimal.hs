import Data.Map (Map, fromListWith, (!))
import Data.Set (Set, union, singleton, size)
import Data.List.Split
import System.Environment

parseLine :: String -> (Integer, Integer)
parseLine = (\[x,y] -> (x,y)) . map (\x -> read x::Integer) . splitOn "|"

values :: [String] -> Map Integer (Set Integer)
values = fromListWith union . map ((\(x,y) -> (y, singleton x)) . parseLine)

repeated k m str = (size (m ! key)) >= k
    where key = (snd . parseLine) str

pipeline k (x:xs) = filter (repeated k m) (x:xs)
    where m = values (x:xs)

main = do
  args <- getArgs
  interact $ unlines. pipeline (read (head args)::Int). lines
