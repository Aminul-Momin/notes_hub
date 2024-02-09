<details open><summary style="font-size:25px;color:White;text-align:center">Python Terminology</summary>

---

<details><summary style="font-size:18px;color:Orange;text-align:left">Scope and Namespace</summary>

-   [Scope and Execution Context](https://realpython.com/python-scope-legb-rule/)
-   [What Are Python Namespaces](https://code.tutsplus.com/tutorials/what-are-python-namespaces-and-why-are-they-needed--cms-28598)

##### What is Namespace in Python?

A namespace is a container that holds a set of names and their corresponding objects, such as variables, functions, classes, etc. Namespaces are used to organize and manage the names used in a Python program to avoid naming conflicts.

There are several types of namespaces in Python:

-   **Local Namespace (or Local Scope)**: This namespace includes names defined in the current function or method. It's temporary and exists only during the execution of the function or method.

-   **Enclosing Namespace (or Enclosing Scope)**: This namespace is used for nested functions. It includes names from the enclosing (outer) function.

-   **Global Namespace (or Global Scope)**: This namespace includes names defined at the top level of a module or script. It persists throughout the module or script execution.

-   **Built-in Namespace**: This namespace includes names of built-in functions and types that are always available in Python.

When you use a name in your Python code, the interpreter looks for that name in the local namespace first, then in the enclosing namespace (if applicable), followed by the global namespace, and finally in the built-in namespace. This order is known as the LEGB rule (Local, Enclosing, Global, Built-in).

##### What is Scope in Python?

A scope is a block of code where an object in Python remains relevant. Every object in Python rvesides in a scope.

The concept of scope rules how variables and names are looked up in your code. It determines the visibility of a variable within the code. The scope of a name or variable depends on the place in your code where you create that variable.

In Python, scope refers to the region of a program where a particular variable is accessible and can be referenced. It defines the visibility and lifetime of a variable within a program. Python has four main types of scope:

-   `Local Scope` (Function Scope):

    -   Variables defined within a function have a local scope.
    -   Local variables can only be accessed within the function where they are defined.
    -   The lifetime of local variables is limited to the execution of the function. Once the function completes its execution, the local variables are destroyed.
    -   If a variable with the same name exists in both the local and global scope, the local variable takes precedence inside the function.

-   `Enclosing Scope` (Nested Function Scope):

    -   When functions are defined within other functions (nested functions), they create an enclosing scope.
    -   Variables in the enclosing scope are accessible to the nested function, but not to the outermost (global) scope.
    -   The enclosing scope allows inner functions to access variables from outer functions, but not vice versa.

-   `Global Scope`:

    -   Variables defined at the top level of a Python program or in a module have a global scope.
    -   Global variables can be accessed from any part of the code, including inside functions.
    -   The lifetime of global variables lasts throughout the entire program's execution.
    -   To modify a global variable from within a function, you need to use the global keyword to indicate that you are referring to the global variable and not creating a new local variable.

-   `Built-in Scope`:
    -   The built-in scope contains all the names of Python's built-in functions, such as print(), len(), etc.
    -   These built-in names are available globally in any part of the code without the need to import anything.

Note: Local scope objects can be synced with global scope objects using keywords such as `global`.

-   Names and Scopes in Python

    -   Since Python is a dynamically-typed language, variables in Python come into existence when you first assign them a value. On the other hand, functions and classes are available after you define them using `def` or `class`, respectively. Finally, modules exist after you import them. As a summary, you can create Python names through one of the following operations:

    -   Assignments, Import operations, Function definitions, Argument definitions in the context of functions, Class definitions.

-   Python Scope vs Namespace

    -   In Python, the concept of scope is closely related to the concept of the namespace. As you’ve learned so far, a Python scope determines where in your program a name is visible. Python scopes are implemented as dictionaries that map names to objects. These dictionaries are commonly called namespaces. These are the concrete mechanisms that Python uses to store names. They’re stored in a special attribute called `.__dict__`.

    -   Names at the top level of a module are stored in the module’s namespace. In other words, they’re stored in the module’s `.__dict__` attribute.

```python
for a in range(2):
    x = 'global {}'.format(a)


def outer():
    global global_var
    global_var = 'Global variable is accessable everywhere'

    for b in range(6):
        x = randint(0, 10)
        x = 'x = {}, this value is from {}'.format(x, 'outer(...)')
        y1 = 'from the first for loop'

    def inner():
        x = 4
        x = 'x = 4, this value is from {}'.format('inner(...)')
        y2 = 'form the second for loop'

        print(x, y1, y2, global_var, sep='\n')
    print(x)
    inner()

outer()
```

### Name Mangling in Python

Name mangling in Python is a mechanism for making class attributes more "private" and for avoiding name clashes when subclassing. It involves adding a prefix to an attribute's name to make it harder to access or accidentally override from outside the class. It's a way to provide some level of "name privacy" within a class, although it's not a security feature and can still be bypassed if necessary. Here are the gory details of Python name mangling:

-   `Double Underscore Prefix (__)`: Name mangling begins when an attribute name in a class is prefixed with a double underscore (e.g., \_\_attribute_name). This is a convention, and it signals to developers that this attribute is intended to be "private" to the class.

-   `Name Transformation`: When Python encounters an attribute with a double underscore prefix, it transforms the attribute's name. Specifically, it adds a prefix to the attribute name, consisting of an underscore and the name of the class where the attribute is defined. For example, if you have a class called MyClass with a double underscore attribute **\_\_private_var_2**, Python internally renames it to **\_MyClass\_\_private_var_2**.

    ```python
    class MyClass:
        def __init__(self):
            self._private_var_1 = 42
            self.__private_var_2 = 420
    ```

-   `Accessing Mangled Attributes`: To access a name-mangled attribute from outside the class, you need to use the mangled name, which includes the class name as a prefix:

    ```python
    obj = MyClass()
    print(obj._MyClass__private_var_2)  # Accesses the name-mangled attribute.
    ```

    -   This helps avoid naming conflicts between attributes in different classes and subclasses.

-   `Name Mangling Is Not Strict Encapsulation`: It's important to note that name mangling is a convention rather than a strict security feature. It does make it less likely for developers to accidentally override or access "private" attributes, but it can still be bypassed. If you know the mangled name, you can access or modify the attribute:

    ```python
    obj._MyClass__private_var_2 = 100 # Modifies the mangled attribute.
    ```

-   `Use Cases`: Name mangling is often used to indicate to other developers that an attribute is intended to be private and should not be accessed directly from outside the class. It is also used to prevent accidental name clashes when subclassing. It's especially useful when creating library code, where you want to provide a level of encapsulation without preventing users of your library from accessing or modifying attributes when necessary.

In summary, name mangling in Python involves transforming attribute names with double underscores into names that include the class name as a prefix to avoid naming conflicts. However, it's a convention rather than a strict enforcement of privacy, and developers can still access mangled attributes if they know the mangled names.

</details>

---

<details><summary style="font-size:18px;color:Orange;text-align:left">Arguments <b style="color:red"> * args </b> and <b style="color:red"> ** kwargs </b></summary>

In Python, unpacking operators allow you to expand elements from iterable objects, such as lists, tuples, or dictionaries, into individual elements or variables. There are three main unpacking operators: _ for iterable unpacking, \*\* for dictionary unpacking, and _ in function arguments.

-   **Iterable Unpacking** (`*`):

Used to unpack elements from an iterable (e.g., list or tuple).
The \* operator is placed before an iterable variable to unpack its elements.

```python
# Example of iterable unpacking
original_list = [1, 2, 3]
unpacked_list = [*original_list, 4, 5]
print(unpacked_list)  # Output: [1, 2, 3, 4, 5]

# Unpacking a list into variables
first, *rest = [1, 2, 3, 4, 5]
print(first)  # Output: 1
print(rest)   # Output: [2, 3, 4, 5]
```

-   **Dictionary Unpacking** (`**`):

Used to unpack key-value pairs from a dictionary.
The \*\* operator is placed before a dictionary variable to unpack its key-value pairs.

```python
# Example of dictionary unpacking
original_dict = {'a': 1, 'b': 2}
unpacked_dict = {**original_dict, 'c': 3}
print(unpacked_dict)  # Output: {'a': 1, 'b': 2, 'c': 3}

# Unpacking elements for a function call
values = [1, 2, 3, 4, 5]
print(*values)  # Output: 1 2 3 4 5

# Unpacking a dictionary's keys and values into a function
person = {'name': 'John', 'age': 30, 'city': 'New York'}
print(**person)  # Output: name=John age=30 city=New York
```

-   **Function Arguments** (`*`):

Used in function definitions and calls to handle variable numbers of arguments.
The _ operator in a function definition collects positional arguments into a tuple.
The _ operator in a function call unpacks elements from an iterable into positional arguments.

```python
# Example of function arguments unpacking
def example_function(*args):
    print(args)

elements_to_unpack = [1, 2, 3]
example_function(*elements_to_unpack)  # Output: (1, 2, 3)
```

In this example, *args in the function definition collects the positional arguments into a tuple, and *elements_to_unpack in the function call unpacks the elements from the list into positional arguments.

Unpacking operators provide a concise and flexible way to work with iterable objects and function arguments in Python.

#### Variable-Length Arguments and Key-word Arguments

What does `*args` and `**kwargs` mean?

`*args`:

-   `*args` is a special syntax used in the function definition to pass variable-length arguments.
-   `*` means variable length and `args` is the name used by convention. You can use any other.

`**kwargs`:

-   `**kwargs` is a special syntax used in the function definition to pass variable-length keyworded arguments.
-   Here, also, `kwargs` is used just by convention. You can use any other name.
-   Keyworded argument means a variable that has a name when passed to a function.
-   It is actually a dictionary of the variable names and its value.

```python
def test_args(first_arg, *args, **kwargs):
    kwargs = {"_int": 100, **kwargs}
    args = (*args,50)
    print(args[-1])

    if kwargs.get('_int'): kwargs['_int'] = kwargs['_int'] + 10
    if kwargs.get('my_int2'): kwargs['my_int'] = kwargs['my_int'] + 20

    print(first_arg, args, kwargs, sep='\n')


test_args('test_arg1', 'first_arg', [2]*3, 'test_arg2', _str="kwarg#2", _int=30)
```

</details>

---

<details><summary style="font-size:18px;color:Orange;text-align:left">Decorator</summary>

A decorator is a design pattern that allows you to extend or modify the behavior of a callable object (functions, methods, or classes) without modifying its source code. Decorators are applied using the `@decorator` syntax, where decorator is a function or a class that takes a function as an argument and returns a new function.

Decorators are commonly used for various purposes, such as logging, authorization, caching, and code instrumentation. They provide a clean and reusable way to extend the functionality of functions or methods. Additionally, Python has some built-in decorators (e.g., `@staticmethod`, `@classmethod`, `@property`) and third-party libraries offer many more for different use cases.

</details>

---

<details><summary style="font-size:18px;color:Orange;text-align:left">Iterator</summary>

What are **Iterators** in Python?

An iterator is an object that represents a stream of data and can be iterated (looped) over. Iterators are used to traverse through a sequence of elements, one at a time, and they implement two main methods:

**\_\_iter\_\_**: This method returns the iterator object itself. It is required for an object to be considered an iterator.

**\_\_next\_\_**: This method returns the next element from the iterator. When there are no more elements, it should raise the **StopIteration** exception to signal the end of the iteration.

To create an iterator in Python, you can define a class with the **\_\_iter\_\_** and **\_\_next\_\_** methods. Alternatively, you can use the **iter()** and **next()** functions to create and interact with iterators.

**Notes**:

-   It remembers its state i.e., where it is during iteration (see code below to see how)
-   It is also self-iterable.
-   Iterators are objects with which we can iterate over iterable objects like lists, strings, etc.

</details>

---

<details><summary style="font-size:18px;color:Orange;text-align:left">Generator</summary>

Generators in Python are a type of iterable, like lists or tuples, but they generate values on-the-fly instead of storing them in memory. They are implemented using functions that contain one or more yield statements. When a generator function is called, it doesn't get executed immediately. Instead, it returns a generator object, which can be iterated over using a for loop or by using the next() function.

The key characteristics of generators are:

-   `Lazy Evaluation`: Generators use lazy evaluation, meaning they produce values only when requested. Each time a value is requested from the generator, the function execution resumes from where it left off, continuing until it hits the next yield statement.

-   `Memory Efficiency`: Since generators do not store all the values in memory at once, they are memory-efficient, especially when dealing with large datasets or infinite sequences.

-   `Iteration`: Generators are iterable, and you can loop over them using a for loop. They produce values one at a time during iteration.

-   `Stateless`: Generators are stateless; they do not retain any information between iterations. Each time you iterate over a generator, it starts execution from the beginning of the generator function.

-   `Infinite Sequences`: Generators can be used to create infinite sequences or streams of data, where the values are generated on-the-fly as needed.

```python
## generate fibonacci numbers upto n
def fib(n):
    p, q = 0, 1
    while (p < n):
        yield p
        p, q = q, p + q
```

What is **Generator expression** in Python?

A **generator expression** is a concise and memory-efficient way to create a generator on-the-fly. It has a similar syntax to a list comprehension, but it returns a generator object instead of a list. Generator expressions are denoted by parentheses `()` instead of square brackets `[]`, which are used for list comprehensions.

</details>

---

<details><summary style="font-size:18px;color:Orange;text-align:left">Context Manager</summary>

A context manager in Python is an object that defines the methods `__enter__()` and `__exit__()`. It is used to set up and tear down resources, such as opening and closing a file, acquiring and releasing a lock, or connecting and disconnecting from a database. The `with` statement in Python is commonly used with context managers to simplify resource management.

```python
with open('file.txt', 'r') as file:
    content = file.read()
    # Perform operations with the file

# After the block, the file is automatically closed
```

In this example, the `open()` function returns a context manager object that represents the opened file. When the with-statement is executed, it calls the `__enter__()` method of the context manager, which initializes the file and returns it. Then, the block of code inside the with-statement is executed. Finally, when the block is exited, the `__exit__()` method is called, which ensures that the file is closed properly, even if an exception occurred within the block.

Context managers can also be created by defining a class and implementing the `__enter__()` and `__exit__()` methods. This allows you to customize the behavior of the context manager and define any necessary setup or cleanup actions.

Context managers are widely used for managing resources that require initialization and cleanup, ensuring that the necessary actions are performed reliably and conveniently. They help improve code readability, simplify error handling, and promote good resource management practices.

Context managers allow us to properly manage resources so that we can specify exactly what we want to set up and tear down when working with certain objects. There are two ways that we could work with files using context manager. We no longer have to remember to close down the file after we're done working with it. And not only that, but this is also recommended because if we throw an error when working with this file, then it's still going to get closed properly. And that is why contact managers are so useful. It handles the tear down of the resources for us so that we don't have to remember to do it. And the more that is handled for us automatically, the better. So this is great for files, but it's useful for so many different resources. So for example we could use this to connect to and close databases automatically. We could acquire and release locks.

</details>

---

<details><summary style="font-size:18px;color:Orange;text-align:left">Module and Function</summary>

### Built-in attributes of Python Module.

In Python, modules are a way to organize code into reusable files. While modules can have various attributes and functions, there are a few built-in attributes that are commonly associated with modules.

Here are some of the key built-in attributes of a Python module:

-   `__name__`: This attribute holds the name of the module. If the module is the main program being executed, `__name__` is set to `__main__`. Otherwise, it is set to the module's name.
-   `__file__`: This attribute holds the path to the source file of the module, if available. It is None for built-in modules and modules that are dynamically generated.
-   `__dict__`: This attribute holds the dictionary that defines the module's namespace. It maps attribute names to their corresponding values.
-   `__builtins__`: This attribute holds a reference to the built-in namespace, which contains all the built-in functions, objects, and exceptions.
-   `__doc__`: This attribute holds the module's documentation (docstring), which is a string containing information about the module's purpose, usage, and more.
-   `__package__`: This attribute holds the name of the package that the module belongs to. It is None for top-level modules.
-   `__loader__`: This attribute holds a reference to the module's loader, which is responsible for loading the module. It is used for modules loaded using the importlib machinery.
-   `__spec__`: This attribute holds a reference to the module's specification, which is an object that encapsulates information about how the module is to be imported. It is used for modules loaded using the importlib machinery.
-   `__cached__`: This attribute holds the path to the compiled bytecode file of the module, if available. It is used to speed up subsequent imports by avoiding recompilation.
-   `__package__`: This attribute holds the name of the package that the module belongs to. It is set to None if the module is not part of a package.
-   `__cached__`: This attribute holds the path to the cached bytecode file associated with the module, if available.
-   `__path__`: This attribute is a list containing the paths to subdirectories within a package. It is set for packages, not individual modules.

These built-in attributes provide information about the module's metadata, source file, and other properties. You can access them like any other attribute of the module. Keep in mind that some of these attributes might not be present in all modules, especially in built-in modules or dynamically generated modules.

```python
def dir_help():
    L = []
    print(dir(object))
    print(dir(L))
    print(dir(dict))

# print(__package__)

# print(__builtins__)

# print(__file__)

# print(__name__)

# print(__doc__)

# dir_help()
```

### Built-in attributes of Python Functions.

In Python, functions are first-class objects, which means they have special built-in attributes that provide information about the function itself. These attributes are prefixed and suffixed with double underscores (`__`).

Here are some of the key special built-in attributes of a Python function:

-   `__name__`: This attribute holds the name of the function as a string.
-   `__annotations__`: This attribute holds a dictionary containing function annotations, which provide additional information about function parameters and return values.
-   `__dict__`: This attribute holds the function's attribute dictionary, mapping attribute names to their corresponding values.
-   `__globals__`: This attribute holds a reference to the dictionary representing the global namespace in which the function was defined.
-   `__call__`: This attribute defines the behavior of the function when it is called. It allows the function to be callable like any other object.
-   `__defaults__`: This attribute holds a tuple containing default argument values for the function's parameters. If a parameter has no default value, its corresponding entry in the tuple is set to None.
-   `__module__`: This attribute holds the name of the module in which the function was defined. If the function is defined in the main program, it is set to "**main**".
-   `__doc__`: This attribute holds the function's documentation string (docstring), which provides information about the function's purpose, usage, and more.
-   `__code__`: This attribute holds the code object that represents the compiled function's bytecode.
-   `__closure__`: This attribute holds a tuple of cell objects representing the closed-over variables used by nested functions. It is None for functions that don't close over any variables.
-   `__kwdefaults__`: This attribute holds a dictionary containing keyword-only default values for function parameters.
-   `__qualname__`: This attribute holds the qualified name of the function, including the full module path.

These special attributes provide introspection capabilities, allowing you to inspect and interact with functions programmatically. They are useful for various purposes, such as creating decorators, documenting functions, and understanding their behavior and context.

</details>

---

<details><summary style="font-size:18px;color:Orange;text-align:left">Sliceing in Python</summary>

Slice notation (`[:]`) creates a new copy of the original list (or any other sliceable object). This is often referred to as a "shallow copy." A shallow copy creates a new object but doesn't create new objects for the elements inside the original object. Instead, it references the same objects as the original.

-   Syntax: `[start : stop : step]`
-   `start` is the starting index from where to slice a list or tuple
-   `stop` is the ending index or where to sop.
-   `step` is the number of steps to jump.
-   Default value for `start` is `0`, `stop` is `len(items)`, `step` is `1`.
-   Slicing can be done on strings, arrays, lists, and tuples.

```python
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
print(numbers[1 : : 2])  # output : [2, 4, 6, 8, 10]
print(numbers[ : 9: 3])  # output : [1, 4, 7]
print(numbers[:9:])      # output : [1, 2, 3, 4, 5, 6, 7, 8, 9]
```

</details>

---

<details><summary style="font-size:18px;color:Orange;text-align:left">Regular Expression</summary>

| Special Sequences | Meaning                              |
| ----------------- | ------------------------------------ |
| `.`               | Any Character Except New Line        |
| `\d`              | Digit `(0-9)`                        |
| `\D`              | Not a Digit `(0-9)`                  |
| `\w`              | Word Character `(a-z, A-Z, 0-9, _)`  |
| `\W`              | Not a Word Character                 |
| `\s`              | Whitespace (space, tab, newline)     |
| `\S`              | Not Whitespace (space, tab, newline) |

| Anchore | Meaning               |
| ------- | --------------------- |
| `\b`    | Word Boundary         |
| `\B`    | Not a Word Boundary   |
| `^`     | Beginning of a String |
| `$`     | End of a String       |

| Characterset | Meaning                            |
| ------------ | ---------------------------------- |
| `[]`         | Matches Characters in brackets     |
| `[^ ]`       | Matches Characters NOT in brackets |
| `\|`         | Either Or                          |
| `( )`        | Group                              |

| Quantifiers | Meaning                       |
| ----------- | ----------------------------- |
| `*`         | 0 or More                     |
| `+`         | 1 or More                     |
| `?`         | 0 or One                      |
| `{3}`       | Exact Number                  |
| `{3,4}`     | Range of Numbers `(Min, Max)` |

-   Example:
    -   `[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+`

</details>

---

<details><summary style="font-size:18px;color:Orange;text-align:left">Exception Handling</summary>

```python
try:
    x = pow(2,3)
    print(x)
except:  # It only runs if exception is raised
    x = abs(-10)
    print(x)
else:    # It only runs if exception is not raised
    x = x**2
    print(x)
finally: # It runs all the time independent of except or else
    x = x**(1/2)
    print(x)

def divide_numbers(a, b):
    try:
        result = a / b
    except ZeroDivisionError as e:
        print(f"ERROR: {e}")
        result = None
    except TypeError:
        print("Error: Invalid types for division!")
        result = None
    else:
        print("Division successful!")
    finally:
        print("Execution completed.")
    return result

# Test cases
# print(divide_numbers(10, 2))    # Output: Division successful! Execution completed. 5.0
# print(divide_numbers(5, 0))     # Output: Error: Cannot divide by zero! Execution completed. None
# print(divide_numbers(10, "2"))  # Output: Error: Invalid types for division! Execution completed. None

test_cases = [(10,2), (5,0), (10,"2")]
for test_case in test_cases:
    print(divide_numbers(*test_case))
    print("="*30)
```

</details>

---

<details><summary style="font-size:18px;color:Orange;text-align:left">Concurrency vs parallelism</summary>

-   [Unlocking your CPU cores in Python (multiprocessing)](https://www.youtube.com/watch?v=X7vBbelRXn0&t=572s)
-   [mCoding: Intro to async Python | Writing a Web Crawler](https://www.youtube.com/watch?v=ftmdDlwMwwQ&t=33s)
-   [How To Easily Do Asynchronous Programming With Asyncio In Python](https://www.youtube.com/watch?v=2IW-ZEui4h4&t=69s)
-   [Next-Level Concurrent Programming In Python With Asyncio](https://www.youtube.com/watch?v=GpqAQxH1Afc)

#### Global Interpreter Lock (GIL)

The Global Interpreter Lock (GIL) in widely used CPython is a mechanism that ensures only one thread executes Python bytecode at a time in a single process, even on multi-core processors. It is a mutex (lock) that protects access to Python objects, preventing multiple threads from executing Python bytecode concurrently. This means that, by default, Python cannot fully utilize the processing power of multi-core CPUs for CPU-bound tasks.

It is important to note that the GIL is specific to CPython, and other implementations of Python (such as Jython, IronPython, or PyPy) may not have a GIL or may have different mechanisms for handling concurrent execution.

In simple terms, the GIL ensures that Python's memory management is thread-safe, preventing conflicts that can arise when multiple threads modify data structures. But it also limits Python's ability to perform true parallel processing. While this can be a limitation for CPU-bound tasks, Python remains an excellent choice for I/O-bound tasks, thanks to its asynchronous programming capabilities and third-party libraries that help bypass the GIL when necessary.

-   `Purpose`:

    -   The primary purpose of the `GIL` is to serialize access to Python objects, preventing multiple native threads from executing Python bytecodes in parallel.
    -   It ensures that only one thread can execute Python code in the interpreter at any given time.

-   `Why the `GIL` Exists`:

    -   CPython, the reference implementation of Python, uses reference counting to manage memory. The `GIL` simplifies memory management by eliminating the need for complex and expensive locking mechanisms to protect against memory management issues.
    -   The `GIL` also ensures thread safety for Python's built-in data structures, making it easier to write and maintain Python's standard library.

-   `Impact on Multithreaded Programs`:

    -   Due to the `GIL`, multithreaded Python programs may not achieve true parallelism, especially for CPU-bound tasks. This means that multiple threads running Python code cannot utilize multiple CPU cores simultaneously.
    -   For I/O-bound tasks (e.g., network operations, file I/O), the `GIL` is less of a concern because Python threads can release the `GIL` while waiting for I/O operations to complete. This allows multiple threads to make progress concurrently in such cases.

-   `Impact on CPU-Bound Tasks`:

    -   CPU-bound tasks, which involve heavy computation, are the most affected by the `GIL`. In these cases, multithreaded Python programs may not see significant performance improvements because only one thread can execute Python bytecodes at a time.

-   `Alternative Implementations`:

    -   Some alternative Python implementations, such as Jython (Python on the Java Virtual Machine) and IronPython (Python on the .NET Framework), do not have a `GIL` and can fully utilize multiple CPU cores for parallel execution. However, they have their own limitations and may not be as widely used as CPython.

-   `Mitigating `GIL` Limitations`:

    -   To achieve parallelism in Python for CPU-bound tasks, you can use multiprocessing, which creates separate processes, each with its own Python interpreter and memory space. This allows true parallel execution.
    -   Alternatively, you can use other languages or libraries that are designed for parallel and concurrent programming, such as C/C++ extensions, or take advantage of multicore capabilities outside of the Python interpreter.

-   `Conclusion`: the Global Interpreter Lock (`GIL`) is a mutex in CPython that ensures only one thread can execute Python code at a time. This has implications for the parallelism and performance of multithreaded Python programs, particularly for CPU-bound tasks. For I/O-bound tasks, Python threads can still be useful due to the `GIL`'s ability to release during blocking operations.

#### What is bytecode in python?

In Python, bytecode refers to the intermediate representation of a Python program that is generated by the Python interpreter. When you write a Python script, the source code is first compiled into bytecode before it is executed by the Python interpreter.

**Source Code**: You write your Python code in a high-level language.

**Tokenization and Parsing**: The Python interpreter tokenizes the source code and parses it into a syntax tree.

**Intermediate Bytecode Generation**: The syntax tree is then translated into a lower-level, platform-independent bytecode. This bytecode is a set of instructions that the Python interpreter can understand.

**Execution**: The Python interpreter executes the bytecode on the Python Virtual Machine (PVM), which is a runtime environment that interprets the bytecode and executes the corresponding operations.

The use of bytecode allows Python to be a versatile and platform-independent language. Python programs can be written once and run on any platform that has a compatible Python interpreter. The bytecode serves as an intermediate step that makes this cross-platform execution possible.

---

Concurrency and parallelism are two related but distinct concepts in Python, as well as in many other programming languages. They both deal with executing multiple tasks simultaneously, but they achieve this in different ways and serve different purposes. While both concurrency and parallelism involve the execution of multiple tasks simultaneously, concurrency is more about structuring your code to efficiently manage tasks, especially those that may block, while parallelism is about actually executing tasks in parallel to improve performance by utilizing multiple CPU cores or processors. The choice between concurrency and parallelism depends on the nature of the tasks you need to perform and the performance goals of your application.

-   `Concurrency`: Concurrency is a design principle that allows you to structure your code in a way that it can handle multiple tasks or operations simultaneously without necessarily running them in parallel. It's more about managing and organizing tasks efficiently, especially when dealing with tasks that may block, such as I/O operations (e.g., reading from files, making network requests). In Python, you can achieve concurrency using various techniques and libraries, including:

    -   `Threading`: Python's threading module allows you to create and manage threads. Threads can run concurrently within the same process. However, due to Python's Global Interpreter Lock (GIL), true parallelism is often limited, and threads may not take full advantage of multiple CPU cores.

    -   `Multiprocessing`: The multiprocessing module enables you to create multiple processes, each with its own Python interpreter and memory space. This allows for true parallelism, as each process can run on a separate CPU core.

    -   `Asyncio`: Python's asyncio library provides support for asynchronous programming using coroutines. It allows you to write non-blocking code that can efficiently manage and switch between multiple tasks, such as handling multiple I/O-bound operations concurrently.

-   `Parallelism`: Parallelism, on the other hand, is the actual simultaneous execution of multiple tasks on multiple CPU cores or processors, with the goal of improving performance and reducing execution time. It's often used for tasks that can be divided into smaller, independent subtasks that can run in parallel. In Python, you can achieve parallelism using:

    -   `Multiprocessing`: As mentioned earlier, the multiprocessing module can be used to create multiple processes, each of which runs in parallel on separate CPU cores.

    -   `Third-Party Libraries`: Python has several third-party libraries, such as concurrent.futures, that provide high-level interfaces for concurrent and parallel programming, making it easier to write code that can take advantage of multiple cores.

#### Thread vs Multiprocessing vs Multitasking vs Asynchronous Programming

In Python, "threading," "multiprocessing," and "asynchronous programming" are three different approaches to achieving concurrent execution, and each has its own use cases and benefits. Let's compare these approaches in terms of their characteristics and when to use them:

-   `Threading (Thread-Based Concurrency)`:

    -   `Concurrency Model`: Threading uses multiple threads within a single process, and these threads share the same memory space.
    -   `Use Cases`:
        -   Well-suited for I/O-bound tasks (e.g., file I/O, network requests) where threads can release the Global Interpreter Lock (GIL) during blocking operations.
        -   Not ideal for CPU-bound tasks because Python's GIL can limit true parallelism, causing threads to compete for CPU time rather than running in parallel.
    -   `Advantages`:
        -   Relatively lightweight compared to processes, making it efficient for managing many concurrent I/O-bound tasks.
        -   Easier communication and data sharing between threads since they share memory.
    -   `Drawbacks`:
        -   Limited parallelism for CPU-bound tasks due to the GIL.
        -   Thread safety concerns when multiple threads access shared data simultaneously.

-   `Multiprocessing (Process-Based Concurrency)`:

    -   `Concurrency Model`: Multiprocessing uses multiple separate processes, each with its own Python interpreter and memory space. These processes can run in parallel on multi-core CPUs.
    -   `Use Cases`:
        -   Ideal for CPU-bound tasks where true parallelism is required because each process runs independently on a separate core.
        -   Suitable for I/O-bound tasks as well, but processes have more overhead than threads.
    -   `Advantages`:
        -   Achieves true parallelism, making it suitable for multi-core systems.
        -   Each process has its own memory space, reducing concerns about shared data and thread safety.
    -   `Drawbacks`:
        -   Higher memory and resource overhead compared to threads.
        -   Inter-process communication (IPC) can be more complex than thread communication.

-   `Multitasking`: Multitasking allows multiple programs to run concurrently on a single CPU. This can be achieved in several ways:

    -   `Preemptive Multitasking`: The operating system divides CPU time into small time slices and allocates these slices to different processes. If a process exceeds its time slice, it's preempted (paused) to allow another process to run. The CPU scheduler ensures fair access to the CPU.

    -   `Cooperative Multitasking`: In this model, processes voluntarily yield control of the CPU. Each process must explicitly release control to allow other processes to run. This approach requires more cooperation among processes and can be less robust.

    -   `Multithreading`: Multithreading is a form of multitasking where a single program is divided into multiple threads. Threads share the same memory space, which can lead to more efficient communication and data sharing. They are suitable for tasks like handling multiple connections or parallelizing computation within a program.

    -   `Time-Sharing`: Time-sharing systems were among the first to introduce true multitasking. They divided CPU time into small slices, allowing multiple users to interact with a computer concurrently via terminals. Each user's commands were processed during their allocated time slice.

-   `Asynchronous Programming (Async/Await)`:

    -   `Concurrency Model`: Asynchronous programming uses a single thread to manage multiple tasks that may involve I/O-bound operations. It allows tasks to yield control back to the event loop when waiting for I/O, rather than blocking the entire thread.
    -   `Use Cases`:
        -   Excellent for I/O-bound tasks where waiting for external resources (e.g., web requests, database queries) is common.
        -   Not ideal for CPU-bound tasks because a single thread cannot take full advantage of multiple CPU cores.
    -   `Advantages`:
        -   Efficiently handles a large number of concurrent I/O-bound tasks with relatively low overhead.
        -   Simplifies concurrency with straightforward code using async and await keywords.
    -   `Drawbacks`:
        -   Limited parallelism for CPU-bound tasks, as it uses a single thread.
        -   Requires adherence to asynchronous programming principles and may involve a learning curve.

-   `Conclusion`: The choice among these concurrency approaches depends on your specific application requirements, the nature of the tasks you're performing, and the available hardware resources. In some cases, a combination of these techniques may be appropriate to achieve the desired level of concurrency and performance.

    -   Use Threads when dealing with many concurrent I/O-bound tasks, and the GIL limitations are not a concern.

    -   Use Multiprocessing when you need true parallelism for CPU-bound tasks, especially on multi-core systems.

    -   Use Asynchronous Programming when handling concurrent I/O-bound tasks efficiently, and you want to write non-blocking code that simplifies handling asynchronous operations.

#### CPU vs Process vs Thread:

-   `CPU (Central Processing Unit)`:

    -   The CPU is the primary processing unit of a computer. It performs all the arithmetic, logic, and control operations required to execute instructions.
    -   Modern PCs typically have multi-core CPUs, which means there are multiple processing units (cores) on a single chip.
    -   Each core can execute instructions independently, allowing for parallel processing of tasks.

-   `Process`:

    -   A process is an independent program or application running on a computer. It includes its own memory space, system resources, and execution environment.
    -   Each process has its own program counter, registers, and stack.
    -   Multiple processes can run concurrently on a multi-core CPU, allowing for parallelism and multitasking.

-   `Thread`:

    -   A thread is a lightweight unit of execution within a process. Threads share the same memory space and resources as the process they belong to.
    -   Threads within a process can run concurrently and share data, which makes them suitable for tasks that require coordination and communication.
    -   Multithreading allows for parallelism within a single process and can take advantage of multi-core CPUs.

-   Can multiple process run on a single core?

    -   No, multiple processes cannot run simultaneously on a single core of a CPU. A core can execute instructions for one process at a time. However, modern operating systems and processors support multitasking and time-sharing, which gives the illusion that multiple processes are running concurrently. In reality, the CPU rapidly switches between processes, giving each a small time slice for execution.
    -   This concept is known as time-sharing or multitasking, and it allows multiple processes to run on a single core. The operating system's scheduler allocates CPU time to each process in a way that makes it appear as though they are running simultaneously, but they are actually taking turns.
    -   In contrast, on multi-core processors, each core can handle the execution of a separate process at the same time, providing true parallelism and better performance for multithreaded and multiprocessing applications.

-   How multiple application gets run on a single Core?
    -   Multiple applications running on a single core are managed by the operating system's process scheduler. The operating system employs a scheduling algorithm that allocates CPU time to different processes, allowing them to share the core efficiently. This mechanism is known as multitasking or time-sharing.

</details>
</details>

---

---

<details open><summary style="font-size:25px;color:White;text-align:center">Programming Terminology</summary>

---

<details><summary style="font-size:18px;color:Orange;text-align:left">Shallow Copy / Deep Copy</summary>

In Python, "shallow copy" and "deep copy" are two different methods used to create copies of objects, especially when dealing with complex data structures like lists, dictionaries, or custom objects. The key difference between them lies in how they handle nested objects (objects within objects) during the copy process.

#### Shallow Copy:

A shallow copy creates a new object, but it does not create new copies of nested objects. Instead, it references the original nested objects in the new container. In other words, a shallow copy is a copy of the top-level container object, but the elements inside that container are still shared between the original object and the copied object.
To create a shallow copy in Python, you can use the copy module's copy() function or the object's own copy() method.

```python
import copy

original_list = [1, 2, [3, 4]]
shallow_copied_list = copy.copy(original_list)

# Modify the nested list in the shallow copy
shallow_copied_list[2][0] = 99

print(original_list)          # Output: [1, 2, [99, 4]]
print(shallow_copied_list)    # Output: [1, 2, [99, 4]]
```

As you can see, when we modify the nested list in the shallow copied list, the change is also reflected in the original list because they share the same reference to the nested list.

#### Deep Copy:

A deep copy, on the other hand, creates a completely independent copy of the original object along with all its nested objects. It recursively creates new copies of all the objects found in the original object, including all nested objects. This means that changes made to nested objects in the deep copy won't affect the original object or vice versa.
To create a deep copy in Python, you can use the copy module's deepcopy() function.

```python
import copy

original_list = [1, 2, [3, 4]]
deep_copied_list = copy.deepcopy(original_list)

# Modify the nested list in the deep copy
deep_copied_list[2][0] = 99

print(original_list)          # Output: [1, 2, [3, 4]]
print(deep_copied_list)       # Output: [1, 2, [99, 4]]
```

In this case, the modification to the nested list in the deep copied list does not affect the original list because they are now independent copies.

#### When to use Shallow Copy and Deep Copy:

-   `Shallow Copy`:

    -   Use a shallow copy when you want to create a new container object, but you want to keep the references to the nested objects intact (i.e., you want to share the nested objects between the original and copied objects).
    -   Shallow copies are generally faster and more memory-efficient since they only copy references to objects and not the objects themselves.

-   `Deep Copy`:
    -   Use a deep copy when you need a completely independent copy of the original object and all its nested objects. This ensures that changes to the copied object won't affect the original object or any of its nested objects.
    -   Deep copies are slower and consume more memory, especially for complex data structures, since they recursively copy all nested objects.

```python
from copy import copy, deepcopy

list_1 = [1, 2, [3, 5], 4]

## shallow copy

list_2 = copy(list_1)
list_2[3] = 7
list_2[2].append(6)

list_2 # output => [1, 2, [3, 5, 6], 7]

list_1 # output => [1, 2, [3, 5, 6], 4]

## deep copy

list_3 = deepcopy(list_1)
list_3[3] = 8
list_3[2].append(7)

list_3 # output => [1, 2, [3, 5, 6, 7], 8]

list_1 # output => [1, 2, [3, 5, 6], 4]
```

</details>

---

<details><summary style="font-size:18px;color:Orange;text-align:left">Duck Typing</summary>

-   [Duck Typing and Asking Forgiveness, Not Permission (EAFP)](https://www.youtube.com/watch?v=x3v9zMX1s4s)

Duck typing is a concept in programming languages, particularly in dynamically-typed languages like Python. The term "duck typing" comes from the saying, "If it looks like a duck, swims like a duck, and quacks like a duck, then it probably is a duck." In the context of Python, it means that the type or the class of an object is determined by its behavior rather than its explicit type.

In languages with static typing, you usually need to declare the type of a variable explicitly, and the compiler enforces that the variable must always be of that specific type. In contrast, Python uses dynamic typing, and variables can hold values of any type at runtime. Duck typing takes advantage of this dynamic nature, allowing Python to be more flexible and concise in handling different types of objects.

In Python, you can perform operations on objects without worrying about their specific type, as long as they support the required methods or behavior. If an object supports the required methods, it is considered to be of the necessary type for that particular operation, regardless of its actual class.

Here's an example of duck typing in Python:

```python
class Duck:
    def quack(self):
        print("Quack!")

class Dog:
    def quack(self):
        print("Dog does not quack but makes a different sound.")

class Robot:
    def beep(self):
        print("Beep!")

def make_sound(animal):
    animal.quack()

duck = Duck()
dog = Dog()
robot = Robot()

make_sound(duck)  # Output: Quack!
make_sound(dog)   # Output: Dog does not quack but makes a different sound.
# make_sound(robot)  # Throws an AttributeError since Robot doesn't have a 'quack' method.
```

In this example, we define three different classes Duck, Dog, and Robot. Each class has its own quack or beep method. The make_sound function takes an argument animal and calls the quack method on it. Even though the make_sound function doesn't know the exact type of the animal, it still works as long as the object passed to it has a quack method.

Duck typing is a powerful concept that allows Python code to be more generic, extensible, and easy to maintain. However, it also comes with some trade-offs. Since the type of an object is determined at runtime, there is less compile-time safety, and errors related to incorrect method calls might only be discovered during runtime. Careful documentation and testing are important to ensure the correct behavior of the code.

</details>

---

<details><summary style="font-size:18px;color:Orange;text-align:left">Imperative Programming vs Declarative Programming</summary>

Imperative and declarative programming are two contrasting programming paradigms that describe different approaches to writing and structuring code. Each paradigm has its own advantages and use cases. Let's delve into the differences between imperative and declarative programming:

#### Imperative Programming:

In imperative programming, the focus is on specifying the sequence of steps or commands that the computer should follow to achieve a desired outcome. This style of programming is closer to how humans think and describe processes. The emphasis is on the `how` of achieving a task. Key characteristics of imperative programming:

-   Code consists of a series of statements that change the program's state.
-   Developers specify detailed step-by-step instructions for solving a problem.
-   Control structures like loops and conditionals are used extensively.
-   Mutable state is common, where variables are assigned new values over time.
-   Examples of imperative programming languages include C, C++, Java, and Python (to some extent).

#### Declarative Programming:

In declarative programming, the focus is on describing what should be accomplished rather than how it should be accomplished. Developers specify the desired outcome or goal, and the program's logic takes care of determining the best way to achieve it. The emphasis is on the `what` of a task. Key characteristics of declarative programming:

-   Code expresses high-level abstractions and relationships.
-   Developers describe the problem and its solution using expressions and statements.
-   Control structures are abstracted and hidden, often through built-in functions or methods.
-   Immutable data structures are favored to avoid side effects.
-   Examples of declarative programming languages include SQL, HTML, CSS, and functional programming languages like Haskell and Lisp.

</details>

---

<details><summary style="font-size:18px;color:Orange;text-align:left">Pure Function vs Higher Order Function vs First class Object</summary>

#### Pure Function:

A pure function is a function that has two main characteristics:

`Deterministic`: For the same input, a pure function will always produce the same output, regardless of the external state or context. It does not rely on any external variables or mutable state.

`No Side Effects`: A pure function does not modify any external state or produce observable side effects, such as changing global variables, modifying input parameters, or performing I/O operations like reading or writing files.

Pure functions have several advantages:

They are easy to reason about and test since their behavior is predictable and isolated.
They can be optimized and memoized more effectively since their output is solely determined by their inputs.
They facilitate parallel and concurrent programming as they do not share data between different executions.
Example of a pure function:

```python
def add(a, b):
    return a + b
```

#### Higher-Order Function:

A higher-order function is a function that takes one or more functions as arguments and/or returns a function as its result. In other words, it treats functions as first-class citizens, enabling them to be manipulated and passed around like any other data type.

Higher-order functions are a fundamental concept in functional programming and allow for more flexible and modular code.

Example of a higher-order function:

```python
def apply_operation(operation, a, b):
    return operation(a, b)

def add(a, b):
    return a + b

def multiply(a, b):
    return a * b

result = apply_operation(add, 3, 5)       # Result: 8
result = apply_operation(multiply, 3, 5)  # Result: 15
```

In this example, apply_operation is a higher-order function that takes another function (add or multiply) as an argument and applies it to the provided arguments a and b.

#### First-Class Object:

In a programming language, a first-class object (or first-class citizen) refers to entities that can be treated like any other object in the language. This means that they can be:

-   Assigned to variables.
-   Passed as arguments to functions.
-   Returned from functions.
-   Stored in data structures like lists or dictionaries.

In a language with support for first-class objects, functions are treated as first-class objects, and they can be used just like any other data type, such as integers, strings, or lists.

In Python, functions are first-class objects, which means you can perform all the above operations on functions. This feature allows for the use of higher-order functions and the creation of closures, among other powerful programming techniques.

Example of functions as first-class objects:

```python
def add(a, b):
    return a + b

def multiply(a, b):
    return a * b

# Assigning functions to variables
operation = add
result = operation(3, 5)  # Result: 8

operation = multiply
result = operation(3, 5)  # Result: 15

# Passing functions as arguments to other functions
def apply_operation(operation, a, b):
    return operation(a, b)

result = apply_operation(add, 3, 5)       # Result: 8
result = apply_operation(multiply, 3, 5)  # Result: 15

# Returning functions from other functions
def get_operation(type):
    if type == 'add':
        return add
    elif type == 'multiply':
        return multiply

operation = get_operation('add')
result = operation(3, 5)  # Result: 8
```

In summary, pure functions are functions that produce consistent outputs with no side effects, higher-order functions treat functions as first-class objects, and first-class objects are entities that can be used just like any other data type in the language. Python's support for first-class functions allows for more expressive and flexible code, enabling powerful programming paradigms like functional programming.

#### Functional Programming vs Procedural Programming

Functional Programming (FP) and Procedural Programming (PP) are two different paradigms for writing computer programs. Here's a comparison of the two:

-   `Functional Programming (FP)`: It is based on the principles of mathematical functions and immutability. Functions in functional programming don't have side effects and do not modify state; they take input and produce output.

    -   `Abstraction`: FP focuses on using functions as first-class citizens, allowing functions to be passed as arguments, returned as values, and assigned to variables. It emphasizes a higher level of abstraction.

    -   `Immutable Data`: In FP, data is typically immutable, meaning once created, it cannot be changed. Instead of modifying data in place, new data structures are created.

    -   `Statelessness`: FP encourages writing stateless functions, which makes code more predictable and easier to reason about. Functions have no side effects on external state.

    -   `Pure Functions`: FP promotes pure functions, which always produce the same output for the same input and have no side effects. This predictability enhances testability and maintainability.

    -   `Recursion`: Recursion is often favored over loops for iteration. Tail recursion is commonly used, and it can replace traditional loop constructs.

    -   `Higher-Order Functions`: FP leverages higher-order functions, such as map, filter, and reduce, for processing collections and performing data transformations.

    -   `Concurrency`: FP can simplify concurrent and parallel programming by minimizing shared state and mutable data.

    -   `Declarative`: FP code tends to be more declarative, focusing on what should be done rather than how it should be done.

-   `Procedural Programming (PP)`: Procedural programming is a subset of imperative programming and is a specific programming style.

    -   `Step-by-Step`: PP follows a step-by-step, linear approach to problem-solving. It emphasizes breaking a problem into smaller procedures or functions.

    -   `Mutable Data`: PP typically uses mutable data structures, where data can be modified in place. It may involve updating variables and changing the program's state.

    -   `Stateful`: PP often uses shared state between procedures, which can lead to unexpected side effects and make code harder to reason about.

    -   `Loops`: Loops, such as for and while, are commonly used for iteration and control flow.

    -   `Procedures`: PP revolves around procedures or functions that perform specific tasks or operations. These procedures are called sequentially to solve a problem.

    -   `Efficiency`: Procedural code can be highly efficient, as it often focuses on low-level optimization and direct manipulation of data.

    -   `Imperative`: PP code tends to be more imperative, specifying how a task should be accomplished through a series of instructions.

-   `Which to Choose`:

The choice between FP and PP depends on the specific requirements of a project and personal preferences. Some projects benefit from the clarity and predictability of FP, while others require the efficiency and control provided by PP. Additionally, many modern programming languages support a mix of paradigms, allowing developers to choose the best approach for each situation.

In practice, the choice of programming paradigm often depends on factors like the problem domain, team expertise, and the existing codebase. Developers may use elements of both paradigms as needed to achieve their goals effectively.

</details>

---

<details><summary style="font-size:18px;color:Orange;text-align:left">Closures</summary>

-   [Closures - How to Use Them and Why They Are Useful](https://www.youtube.com/watch?v=swU3c34d2NQ)

A closure is a powerful concept in programming languages that support first-class functions, like Python. In simple terms, a closure is a function that remembers the environment in which it was created. It retains access to variables, bindings, and other references from the enclosing scope, even after the outer function has finished executing. This allows the inner function to "close over" and capture the state of its surrounding environment.

Let's break down the components and behavior of closures in more detail:

#### Function Definitions and Nested Functions:

In Python, functions can be defined inside other functions, creating what is known as nested functions or inner functions. These inner functions have access to the variables and parameters of the enclosing (outer) function.

```python
def outer_function(x):
    def inner_function(y):
        return x + y
    return inner_function
```

#### Returning Functions:

Closures are often used when a function returns another function. In the example above, the outer_function returns the inner_function. When the inner function is returned, it still has access to the variable x from the outer_function, even though the outer_function has already finished executing.

#### Accessing Variables from the Enclosing Scope:

The inner function can access and "close over" the variables and parameters from its enclosing scope (the scope of the outer function). This is possible because the closure retains a reference to the environment in which it was defined.

```python
add_five = outer_function(5)
result = add_five(10)  # Calling the inner function with y=10 and x=5 from the enclosing scope
print(result)          # Output: 15
```

#### Use Cases for Closures:

-   `Function Factories`: Closures are often used to create function factories, where a higher-order function returns specialized functions based on the parameters passed.
-   `Data Hiding`: Closures can be used to hide variables or data within a function, encapsulating state and protecting it from direct access or modification from outside the function.
-   `Callbacks`: Closures are commonly used for callback functions in event handling, where a function is passed as an argument to be called later, often with access to certain context-specific variables.
-   `Lifetime of Closures`:
    Closures remain in memory as long as they are referenced by other objects. When a closure is returned by a function and assigned to a variable or passed as an argument to another function, the closure will continue to exist in memory. If there are no references to the closure anymore, it will be garbage collected like any other object.

#### Mutable Closures and Gotchas:

When using mutable variables in closures (e.g., lists or dictionaries), you need to be cautious about the "late binding" behavior. Late binding means that the inner function can change the value of a variable in the enclosing scope even after the closure is created. This can lead to unexpected behavior and is something to keep in mind when working with mutable closures.

```python
def create_multiplier():
    factor = 2

    def multiplier(x):
        return x * factor

    factor = 10  # Changing the value of 'factor'
    return multiplier

multiply = create_multiplier()
print(multiply(5))  # Output: 50 (not 10, because the closure remembers the latest value of 'factor')
```

In conclusion, closures in Python are a powerful mechanism that allows functions to retain access to the variables and context of their enclosing scope. This feature is extensively used to create flexible and reusable code, particularly in functional programming and other advanced programming paradigms.

A closure is a powerful concept in programming languages that support first-class functions, like Python. In simple terms, a closure is a function that remembers the environment in which it was created. It retains access to variables, bindings, and other references from the enclosing scope, even after the outer function has finished executing. This allows the inner function to "close over" and capture the state of its surrounding environment.

</details>
</details>

---

<details><summary style="font-size:18px;color:Orange;text-align:left">Title</summary>

</details>
