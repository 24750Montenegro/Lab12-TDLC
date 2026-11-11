# Lab 12 - TDLC

Solución de los cuatro ejercicios del laboratorio en **Haskell**, usando funciones lambda.

## Video de demostración

[Ver video](ENLACE_DEL_VIDEO)

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

![Ejecución del ejercicio 1](capturas/ejercicio1.png)

### Ejercicio 2 - Potencia n-ésima

Inicia con la lista del ejemplo `[1, ..., 10]`. Desde el menú se pueden agregar o eliminar números y calcular la potencia `n` (entero positivo) de cada elemento.

![Ejecución del ejercicio 2](capturas/ejercicio2.png)

### Ejercicio 3 - Matriz transpuesta

Inicia con la matriz del ejemplo. Desde el menú se pueden agregar filas (números separados por espacio o coma, con la misma cantidad de columnas), eliminar filas y calcular la transpuesta.

![Ejecución del ejercicio 3](capturas/ejercicio3.png)

### Ejercicio 4 - Eliminar elementos

Inicia con las listas del ejemplo. Desde el menú se pueden agregar o quitar elementos de la lista inicial y de la lista de elementos a borrar, y calcular el resultado.

![Ejecución del ejercicio 4](capturas/ejercicio4.png)
