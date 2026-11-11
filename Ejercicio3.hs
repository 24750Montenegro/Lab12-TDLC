-- Ejercicio 3: matriz transpuesta usando lambdas
import Data.List (intercalate)

-- La fila j de la transpuesta es el elemento j de cada fila original
transpuesta :: [[Int]] -> [[Int]]
transpuesta [] = []
transpuesta m@(primera:_) = map (\j -> map (\fila -> fila !! j) m) [0 .. length primera - 1]

mostrarFila :: [Int] -> String
mostrarFila xs = "[" ++ intercalate ", " (map show xs) ++ "]"

-- Imprime la matriz con las filas alineadas
mostrarMatriz :: String -> [[Int]] -> String
mostrarMatriz nombre m = nombre ++ " = [" ++ intercalate (",\n" ++ replicate (length nombre + 4) ' ') (map mostrarFila m) ++ "]"

x :: [[Int]]
x =
  [ [1, 2, 3, 1]
  , [4, 5, 6, 0]
  , [7, 8, 9, -1]
  ]

main :: IO ()
main = do
  putStrLn (mostrarMatriz "X" x)
  putStrLn ""
  putStrLn (mostrarMatriz "Y" (transpuesta x))
