-- Ejercicio 1: ordenar una lista de diccionarios por un key usando lambdas
import Data.List (intercalate, nub, sortBy)
import System.IO (hFlush, stdout)
import Text.Read (readMaybe)

-- Un valor del diccionario puede ser texto o numero
data Valor = Texto String | Numero Int
  deriving (Eq, Ord)

-- Diccionario como lista de pares (key, valor)
type Dict = [(String, Valor)]

-- Ordena comparando el valor del key en cada diccionario
ordenarPor :: String -> [Dict] -> [Dict]
ordenarPor key = sortBy (\a b -> compare (lookup key a) (lookup key b))

mostrarValor :: Valor -> String
mostrarValor (Texto s)  = "'" ++ s ++ "'"
mostrarValor (Numero n) = show n

mostrarDict :: Dict -> String
mostrarDict dict = "{" ++ intercalate ", " (map (\(k, v) -> "'" ++ k ++ "': " ++ mostrarValor v) dict) ++ "}"

mostrarLista :: [Dict] -> String
mostrarLista ds = "D = [" ++ intercalate ",\n     " (map mostrarDict ds) ++ "]"

telefonos :: [Dict]
telefonos =
  [ [("make", Texto "Nokia"),   ("model", Numero 216), ("color", Texto "Black")]
  , [("make", Texto "Apple"),   ("model", Numero 2),   ("color", Texto "Silver")]
  , [("make", Texto "Huawei"),  ("model", Numero 50),  ("color", Texto "Gold")]
  , [("make", Texto "Samsung"), ("model", Numero 7),   ("color", Texto "Blue")]
  ]

-- Keys unicos presentes en los datos
keys :: [String]
keys = nub (concatMap (\dict -> map fst dict) telefonos)

-- Muestra el menu y repite hasta recibir una opcion valida
pedirKey :: IO String
pedirKey = do
  putStrLn "Keys disponibles:"
  mapM_ (\(i, k) -> putStrLn ("  " ++ show i ++ ") " ++ k)) (zip [1 :: Int ..] keys)
  putStr "Seleccione el key para ordenar: "
  hFlush stdout
  entrada <- getLine
  case readMaybe entrada of
    Just n | n >= 1 && n <= length keys -> return (keys !! (n - 1))
    _ -> do
      putStrLn "Opcion invalida, intente de nuevo.\n"
      pedirKey

main :: IO ()
main = do
  putStrLn "Original:"
  putStrLn (mostrarLista telefonos)
  putStrLn ""
  key <- pedirKey
  putStrLn ("\nOrdenado por '" ++ key ++ "':")
  putStrLn (mostrarLista (ordenarPor key telefonos))
