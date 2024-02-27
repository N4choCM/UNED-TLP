# 📚 Teoría de los Lenguajes de Programación

## 👨🏼‍💻 Haskell

### 🧮 Useful commands

| Command | Description |
| - | - |
| ghci | Starts the interactive mode |
| /= | Inequality operator |
| succ x | Returns the successor of x (i.e., x + 1) |
| min x y | Returns the minimum of the provided values (i.e., x or y) |
| max x y | Returns the maximum of the provided values (i.e., x or y) |
| :l | Loads a file to work with its functions |
| ++ | Concatenation operator for two lists (consider that Strings are treated as lists of Chars in Haskell) |
| : | Concatenation operator for a number and a list of numbers or a Char and a list of Chars (consider Strings are treated in Haskell as lists of Chars) |
| !! x | Operator used after a list to retrieve the element in the x index |
| head [] | Returns the first element in a list |
| tail [] | Returns all the elements in a list except from the first one |
| last [] | Returns the last element in a list |
| init [] | Returns all the elements in a list except from the last one |
| length [] | Returns the number of items the list contains |
| null [] | Returns True if the list is empty, False otherwise |
| reverse [] | Returns the list in the reverse order |
| take x [] | Returns the first x elements in the list |
| drop x [] | Returns all the elements in the list except the first x elements |
| minimum [] | Returns the smallest element in the list |
| maximum [] | Returns the biggest element in the list |
| sum [] | Returns the total sum of all the numbers in the list |
| product [] | Returns the total product of all the numbers in the list |
| x `elem` [] | Returns True if the x is a member of the list, False otherwise |
| [1..20] | Creates a list between 1 and 20 |
| ['a'..'z'] | Creates a list between 'a' and 'z' |
| ['A'..'Z'] | Creates a list between 'A' and 'Z' |
| [2,4..20] | Creates a list between 1 and 20 with a gap of 2 between a member and the next one |
| cycle [] | Creates and infinite loop with the elements in the list. Consider entering a `take x` before to avoid the machine running out of memory |
| repeat x | Exactly the same situation as in the cycle, but just with a Char or number |
| replicate x y | Returns x times the y number or Char |
| [x*y | x <- [1..10]] | Returns x*y being x 1 at the beginning and incrementing its value in 1 in each iteration of the loop |
| [x*y | x <- [1..10], x*y >= 12] | Same, but only prints the results bigger than 12 |
| x `mod` y | Returns the rest of the division between x and y |
| odd x | Returns True if x is odd, False otherwise |
| even x | Returns True if x is even, False otherwise |
| _ <- [] | Used to indicate that it does not matter which value we are retrieving from a list | 
| fst () | Returns the first component of a tuple |
| snd () | Returns the second component in a tuple |
| zip [] [] | Returns a list of tuples, each tuple composed with the first component of the first list and the first component of the second list, then the same with the second component, the third one, etc. |
| :t x | Returns the type of the expression x |
| x :: T | Indicates that x must be of type T |
| minBound :: T | Returns the minimum limit value of the type T |
| maxBound :: T | Returns the maximum limit value of the type T |

### 🤷‍♂️ Difference between tuple and list in Haskell

In Haskell, lists and tuples are both data structures used to store collections of values, but they have some key differences in terms of Mutability, Size, Syntax, Pattern Matching and Performance.

As for the Mutability, Lists [a] are homogeneous collections that can contain elements of the same type. They are mutable. However, Tuples (a, b, c, ...) can contain elements of different types. They are immutable.

Another important point is that Lists can vary in size. They can be empty or contain any number of elements. By contrast, Tuples have a fixed size, determined by the number of elements in them. For instance, a tuple (Int, Bool) will always have exactly two elements.

Regarding the syntax, Lists are constructed using square brackets [ ]. For example: [1, 2, 3, 4]. On the other hand, Tuples are constructed using parentheses ( ). For example: (1, "hello", True).

Pattern Matching is also a key aspect, as Lists can be deconstructed using pattern matching to access their elements and Tuples can also be deconstructed in a similar manner. However, since tuples have a fixed size, pattern matching is often used with a fixed number of elements.

In the performance side, Lists are more efficient for operations that involve adding or removing elements from the beginning of the collection (head, tail, cons, etc.), whereas Tuples are more efficient for operations that involve accessing elements by index or combining heterogeneous values.