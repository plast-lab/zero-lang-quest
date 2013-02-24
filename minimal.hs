import Data.Map (Map, fromListWith, (!))
import Data.Set (Set, union, singleton, size)
import Data.List.Split

parseLine :: String -> (Integer, Integer)
parseLine = (\[x,y] -> (x,y)) . map (\x -> read x::Integer) . splitOn "|"

values :: [String] -> Map Integer (Set Integer)
values = fromListWith union . map ((\(x,y) -> (y, singleton x)) . parseLine)

repeated m str = (size (m ! key)) > 1
    where key = (snd . parseLine) str

pipeline (x:xs) = filter (repeated m) (x:xs)
    where m = values (x:xs)

main = do
  contents <- getContents
  (mapM_ putStrLn. pipeline . lines) contents
