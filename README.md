# Lab 12 - TDLC

Solución de los cuatro ejercicios del laboratorio en **Haskell**, usando funciones lambda.

| Archivo | Ejercicio |
|---|---|
| `Ejercicio1.hs` | Ordenar una lista de diccionarios por un key seleccionado |
| `Ejercicio2.hs` | Potencia n-ésima de cada elemento de una lista |
| `Ejercicio3.hs` | Matriz transpuesta |
| `Ejercicio4.hs` | Eliminar de una lista los elementos indicados |

## Requisitos

- **GHC** (compilador de Haskell). Probado con GHC 9.10.3.
- No se necesitan librerías externas; solo se usan módulos incluidos con GHC (`Data.List`, `System.IO`, `Text.Read`).

### Instalación

1. Instalar **GHCup** siguiendo el comando de https://www.haskell.org/ghcup/ (en Windows se ejecuta desde PowerShell; se pueden dejar todas las opciones por defecto).
   - En Windows el instalador actualiza llaves de MSYS2 y puede mostrar varios `Could not update key`. Es normal y puede tardar varios minutos; no hay que cancelarlo.
2. Cerrar y volver a abrir la terminal.
3. Verificar la instalación:

   ```
   ghc --version
   ```

## Ejecución

Desde la carpeta del proyecto, cada archivo se ejecuta con `runghc`:

```
runghc Ejercicio1.hs
runghc Ejercicio2.hs
runghc Ejercicio3.hs
runghc Ejercicio4.hs
```

También se puede compilar a un ejecutable:

```
ghc Ejercicio1.hs
./Ejercicio1
```

### Ejercicio 1 - Ordenar diccionarios

Muestra la lista original y un menú con los keys disponibles. Se escribe el número del key por el cual ordenar.

```
Keys disponibles:
  1) make
  2) model
  3) color
Seleccione el key para ordenar: 2

Ordenado por 'model':
D = [{'make': 'Apple', 'model': 2, 'color': 'Silver'},
     {'make': 'Samsung', 'model': 7, 'color': 'Blue'},
     {'make': 'Huawei', 'model': 50, 'color': 'Gold'},
     {'make': 'Nokia', 'model': 216, 'color': 'Black'}]
```

### Ejercicio 2 - Potencia n-ésima

Pide la potencia `n` (entero positivo) y la aplica a cada elemento de la lista.

```
Lista inicial: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
Ingrese la potencia n (entero positivo): 3
Potencia 3: [1, 8, 27, 64, 125, 216, 343, 512, 729, 1000]
```

Para usar otra lista, modificar `lista` en el archivo, por ejemplo `lista = [1, 3, 2]`.

### Ejercicio 3 - Matriz transpuesta

```
X = [[1, 2, 3, 1],
     [4, 5, 6, 0],
     [7, 8, 9, -1]]

Y = [[1, 4, 7],
     [2, 5, 8],
     [3, 6, 9],
     [1, 0, -1]]
```

Para usar otra matriz, modificar `x` en el archivo.

### Ejercicio 4 - Eliminar elementos

```
Lista inicial:      ['rojo', 'verde', 'azul', 'amarillo', 'gris', 'blanco', 'negro']
Elementos a borrar: ['amarillo', 'café', 'blanco']
Resultado:          ['rojo', 'verde', 'azul', 'gris', 'negro']
```

Para usar otras listas, modificar `colores` y `aBorrar` en el archivo.
