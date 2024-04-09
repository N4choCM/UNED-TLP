module Main where

import StackMachine
import System.IO

-- "BUCLE" PRINCIPAL --
mainLoop :: IO ()
mainLoop = do
  putStr "\nEscriba una expresión en notación prefija para ser evaluada\nexpresion: "
  hFlush stdout
  e <- getLine
  if e /= ""
    then
      let st = createSynTree (words e)
       in do
            putStrLn ("El arbol de sintaxis abstracta es:\n" ++ show st)
            putStrLn ("\nEl resultado de la evaluacion es:\n" ++ show (evalSynTree st))
            mainLoop
    else putStr "\nFin de la ejecucion\n"

-- FUNCIÓN PRINCIPAL --
main :: IO ()
main = do
  hSetBuffering stdin LineBuffering -- Permite que la entrada pueda ser editada
  mainLoop -- Ejecutamos el "bucle" principal
