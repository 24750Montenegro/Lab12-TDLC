-- Ejercicio 4: eliminar de una lista los elementos indicados usando lambdas
import Data.List (delete, intercalate)
import System.IO (hFlush, stdout)

-- Conserva solo los elementos que no estan en la lista a borrar
eliminar :: [String] -> [String] -> [String]
eliminar borrar = filter (\x -> x `notElem` borrar)

-- Imprime la lista con el formato de Python
mostrarLista :: [String] -> String
mostrarLista xs = "[" ++ intercalate ", " (map (\s -> "'" ++ s ++ "'") xs) ++ "]"

preguntar :: String -> IO String
preguntar texto = do
  putStr texto
  hFlush stdout
  fmap (unwords . words) getLine

colores :: [String]
colores = ["rojo", "verde", "azul", "amarillo", "gris", "blanco", "negro"]

aBorrar :: [String]
aBorrar = ["amarillo", "café", "blanco"]

-- Menu: ambas listas se pasan como argumento en cada vuelta
menu :: [String] -> [String] -> IO ()
menu lista borrar = do
  putStrLn ""
  putStrLn ("Lista inicial:      " ++ mostrarLista lista)
  putStrLn ("Elementos a borrar: " ++ mostrarLista borrar)
  putStrLn "  1) Agregar a la lista inicial"
  putStrLn "  2) Quitar de la lista inicial"
  putStrLn "  3) Agregar a elementos a borrar"
  putStrLn "  4) Quitar de elementos a borrar"
  putStrLn "  5) Calcular resultado"
  putStrLn "  6) Salir"
  opcion <- preguntar "Opcion: "
  case opcion of
    "1" -> do
      x <- preguntar "Elemento a agregar: "
      if null x then invalido else menu (lista ++ [x]) borrar
    "2" -> do
      x <- preguntar "Elemento a quitar: "
      if x `elem` lista then menu (delete x lista) borrar else invalido
    "3" -> do
      x <- preguntar "Elemento a agregar: "
      if null x then invalido else menu lista (borrar ++ [x])
    "4" -> do
      x <- preguntar "Elemento a quitar: "
      if x `elem` borrar then menu lista (delete x borrar) else invalido
    "5" -> do
      putStrLn ("Resultado:          " ++ mostrarLista (eliminar borrar lista))
      menu lista borrar
    "6" -> return ()
    _ -> invalido
  where
    invalido = do
      putStrLn "Opcion o valor invalido."
      menu lista borrar

main :: IO ()
main = do
  putStrLn "Ejercicio 4 - Eliminar elementos"
  menu colores aBorrar
