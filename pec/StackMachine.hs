-- TODO: Change namings
-- TODO: Works perfect with numbers, not with "N" operator
-- TODO: Binaries work good, Unarys not
module StackMachine where

-- Definición de tipos --
type Stack a = [a]

data BOp = ADD | SUB | MUL | DIV
  deriving (Eq, Read, Show)

data UOp = NEG
  deriving (Eq, Read, Show)

data SynTree a
  = Binary BOp (SynTree a) (SynTree a)
  | Unary UOp (SynTree a)
  | Operand a
  deriving (Eq, Read, Show)

-- Creación del árbol sintáctico --
createSynTree :: [String] -> SynTree Integer
createSynTree = fst . buildTree []

-- Construye un árbol sintáctico a partir de una lista de strings y una pila de árboles.
buildTree :: Stack (SynTree Integer) -> [String] -> (SynTree Integer, [String])
buildTree stack (x : xs) =
  case x of
    "+" -> binaryOp ADD -- Si es un operador binario de suma, aplica la función binaryOp con ADD.
    "-" -> binaryOp SUB -- Si es un operador binario de resta, aplica la función binaryOp con SUB.
    "*" -> binaryOp MUL -- Si es un operador binario de multiplicación, aplica la función binaryOp con MUL.
    "/" -> binaryOp DIV -- Si es un operador binario de división, aplica la función binaryOp con DIV.
    "NEG" -> unaryOp NEG -- Si es un operador unario de negación, aplica la función unaryOp con NEG.
    _ -> (Operand (read x), xs) -- Si es un operando, convierte el string a Integer y lo coloca como hoja en el árbol.
  where
    -- Función auxiliar para operadores binarios.
    binaryOp op =
      let (right, rest1) = buildTree stack xs -- Construye el subárbol derecho.
          (left, rest2) = buildTree stack rest1 -- Construye el subárbol izquierdo.
       in (Binary op (reverseTree right) (reverseTree left), rest2) -- Retorna el nodo binario y el resto de la lista.

    -- Función auxiliar para operadores unarios.
    unaryOp op =
      let (operand, rest) = buildTree stack xs -- Construye el subárbol del operando.
       in (Unary op (reverseTree operand), rest) -- Retorna el nodo unario y el resto de la lista.

    -- Función auxiliar para revertir un árbol.
    reverseTree (Binary op left right) = Binary op (reverseTree left) (reverseTree right)
    reverseTree (Unary op tree) = Unary op (reverseTree tree)
    reverseTree operand = operand

-- Evaluación de árboles sintácticos --
evalSynTree :: SynTree Integer -> Integer
evalSynTree = evalPostOrder []

-- Evalúa un árbol sintáctico en orden postfijo dado una pila de valores y el árbol.
evalPostOrder :: Stack Integer -> SynTree Integer -> Integer
evalPostOrder stack (Operand x) = x
evalPostOrder stack (Binary op left right) =
  let leftResult = evalPostOrder stack left -- Evalúa el subárbol izquierdo.
      rightResult = evalPostOrder stack right -- Evalúa el subárbol derecho.
   in applyBinaryOp op leftResult rightResult -- Aplica la operación binaria.
evalPostOrder stack (Unary op tree) =
  let operandResult = evalPostOrder stack tree -- Evalúa el subárbol del operando.
   in applyUnaryOp op operandResult -- Aplica la operación unaria.

-- Aplica una operación binaria a dos operandos.
applyBinaryOp :: BOp -> Integer -> Integer -> Integer
applyBinaryOp ADD x y = x + y
applyBinaryOp SUB x y = x - y
applyBinaryOp MUL x y = x * y
applyBinaryOp DIV x y = x `div` y

-- Aplica una operación unaria a un operando.
applyUnaryOp :: UOp -> Integer -> Integer
applyUnaryOp NEG x = -x
