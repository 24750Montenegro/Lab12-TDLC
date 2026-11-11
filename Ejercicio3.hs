-- Ejercicio 3: matriz transpuesta usando lambdas
import Data.List (intercalate)
import System.IO (hFlush, stdout)
import Text.Read (readMaybe)

-- La fila j de la transpuesta es el elemento j de cada fila original
transpuesta :: [[Int]] -> [[Int]]
transpuesta [] = []
transpuesta m@(primera:_) = map (\j -> map (\fila -> fila !! j) m) [0 .. length primera - 1]

mostrarFila :: [Int] -> String
mostrarFila xs = "[" ++ intercalate ", " (map show xs) ++ "]"

-- Imprime la matriz con las filas alineadas
mostrarMatriz :: String -> [[Int]] -> String
mostrarMatriz nombre m = nombre ++ " = [" ++ intercalate (",\n" ++ replicate (length nombre + 4) ' ') (map mostrarFila m) ++ "]"

preguntar :: String -> IO String
preguntar texto = do
  putStr texto
  hFlush stdout
  fmap (unwords . words) getLine

-- Convierte "1 2 3" o "1, 2, 3" en una lista de enteros
leerFila :: String -> Maybe [Int]
leerFila texto = mapM readMaybe (words (map (\c -> if c == ',' then ' ' else c) texto))

ejemplo :: [[Int]]
ejemplo =
  [ [1, 2, 3, 1]
  , [4, 5, 6, 0]
  , [7, 8, 9, -1]
  ]

-- Menu: la matriz actual se pasa como argumento en cada vuelta
menu :: [[Int]] -> IO ()
menu m = do
  putStrLn ""
  putStrLn (mostrarMatriz "X" m)
  putStrLn "  1) Agregar fila"
  putStrLn "  2) Eliminar fila"
  putStrLn "  3) Calcular transpuesta"
  putStrLn "  4) Salir"
  opcion <- preguntar "Opcion: "
  case opcion of
    "1" -> do
      texto <- preguntar "Fila (numeros separados por espacio o coma): "
      case leerFila texto of
        Just fila | not (null fila) && all (\f -> length f == length fila) m -> menu (m ++ [fila])
        _ -> do
          putStrLn "Fila invalida: solo enteros y con la misma cantidad de columnas que las demas."
          menu m
    "2" -> do
      texto <- preguntar ("Numero de fila a eliminar (1-" ++ show (length m) ++ "): ")
      case readMaybe texto of
        Just i | i >= 1 && i <= length m -> menu (take (i - 1) m ++ drop i m)
        _ -> invalido
    "3" -> do
      putStrLn (mostrarMatriz "Y" (transpuesta m))
      menu m
    "4" -> return ()
    _ -> invalido
  where
    invalido = do
      putStrLn "Opcion o valor invalido."
      menu m

main :: IO ()
main = do
  putStrLn "Ejercicio 3 - Matriz transpuesta"
  menu ejemplo
