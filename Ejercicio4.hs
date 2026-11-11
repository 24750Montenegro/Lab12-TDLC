-- Ejercicio 4: eliminar de una lista los elementos indicados usando lambdas
import Data.List (intercalate)

eliminar :: [String] -> [String] -> [String]
eliminar borrar = filter (\x -> x `notElem` borrar)

mostrarLista :: [String] -> String
mostrarLista xs = "[" ++ intercalate ", " (map (\s -> "'" ++ s ++ "'") xs) ++ "]"

colores :: [String]
colores = ["rojo", "verde", "azul", "amarillo", "gris", "blanco", "negro"]

aBorrar :: [String]
aBorrar = ["amarillo", "café", "blanco"]

main :: IO ()
main = do
  putStrLn ("Lista inicial:      " ++ mostrarLista colores)
  putStrLn ("Elementos a borrar: " ++ mostrarLista aBorrar)
  putStrLn ("Resultado:          " ++ mostrarLista (eliminar aBorrar colores))
