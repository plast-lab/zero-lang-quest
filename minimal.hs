import qualified Data.Map as Map
import qualified Data.Set as Set
import Data.List.Split

parseLine :: String -> (Integer, Integer)
parseLine = (\[x,y] -> (x,y)) . map (\x -> read x::Integer) . splitOn "|"

values :: [String] -> Map.Map Integer (Set.Set Integer)
values = Map.fromListWith Set.union . map ((\(x,y) -> (y, Set.singleton x)) . parseLine)

repeated m str = (Set.size (m Map.! key)) > 1
    where key = (snd . parseLine) str

pipeline (x:xs) = filter (repeated m) (x:xs)
    where m = values (x:xs)

main = do
  contents <- getContents
  (mapM_ putStrLn. pipeline . lines) contents
