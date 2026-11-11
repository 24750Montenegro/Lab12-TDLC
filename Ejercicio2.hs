-- Ejercicio 2: potencia n-esima de cada elemento de una lista usando lambdas
import Data.List (delete, intercalate)
import System.IO (hFlush, stdout)
import Text.Read (readMaybe)

-- Eleva cada elemento de la lista a la n
potencias :: Int -> [Integer] -> [Integer]
potencias n = map (\x -> x ^ n)

mostrarLista :: [Integer] -> String
mostrarLista xs = "[" ++ intercalate ", " (map show xs) ++ "]"

preguntar :: String -> IO String
preguntar texto = do
  putStr texto
  hFlush stdout
  fmap (unwords . words) getLine

ejemplo :: [Integer]
ejemplo = [1 .. 10]

-- Menu: la lista actual se pasa como argumento en cada vuelta
menu :: [Integer] -> IO ()
menu lista = do
  putStrLn ("\nLista actual: " ++ mostrarLista lista)
  putStrLn "  1) Agregar numero"
  putStrLn "  2) Eliminar numero"
  putStrLn "  3) Calcular potencia"
  putStrLn "  4) Salir"
  opcion <- preguntar "Opcion: "
  case opcion of
    "1" -> do
      texto <- preguntar "Numero a agregar: "
      case readMaybe texto of
        Just x -> menu (lista ++ [x])
        Nothing -> invalido
    "2" -> do
      texto <- preguntar "Numero a eliminar: "
      case readMaybe texto of
        Just x | x `elem` lista -> menu (delete x lista)
        _ -> invalido
    "3" -> do
      texto <- preguntar "Ingrese la potencia n (entero positivo): "
      case readMaybe texto of
        Just n | n > 0 -> do
          putStrLn ("Potencia " ++ show n ++ ": " ++ mostrarLista (potencias n lista))
          menu lista
        _ -> invalido
    "4" -> return ()
    _ -> invalido
  where
    invalido = do
      putStrLn "Opcion o valor invalido."
      menu lista

main :: IO ()
main = do
  putStrLn "Ejercicio 2 - Potencia n-esima"
  menu ejemplo
