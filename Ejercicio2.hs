-- Ejercicio 2: potencia n-esima de cada elemento de una lista usando lambdas
import Data.List (intercalate)
import System.IO (hFlush, stdout)
import Text.Read (readMaybe)

potencias :: Int -> [Integer] -> [Integer]
potencias n = map (\x -> x ^ n)

mostrarLista :: [Integer] -> String
mostrarLista xs = "[" ++ intercalate ", " (map show xs) ++ "]"

pedirN :: IO Int
pedirN = do
  putStr "Ingrese la potencia n (entero positivo): "
  hFlush stdout
  entrada <- getLine
  case readMaybe entrada of
    Just n | n > 0 -> return n
    _ -> do
      putStrLn "Valor invalido, intente de nuevo."
      pedirN

lista :: [Integer]
lista = [1 .. 10]

main :: IO ()
main = do
  putStrLn ("Lista inicial: " ++ mostrarLista lista)
  n <- pedirN
  putStrLn ("Potencia " ++ show n ++ ": " ++ mostrarLista (potencias n lista))
