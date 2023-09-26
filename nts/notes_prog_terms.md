# Programming Terminology:

---

<details><summary style="font-size:18px;color:Orange;text-align:left">Scope and Execution Context</summary>

-   [Scope and Execution Context](https://realpython.com/python-scope-legb-rule/)
-   [What Are Python Namespaces](https://code.tutsplus.com/tutorials/what-are-python-namespaces-and-why-are-they-needed--cms-28598)

##### What is Scope in Python?

A scope is a block of code where an object in Python remains relevant. Every object in Python resides in a scope.

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

`Conclusion`: In summary, name mangling in Python involves transforming attribute names with double underscores into names that include the class name as a prefix to avoid naming conflicts. However, it's a convention rather than a strict enforcement of privacy, and developers can still access mangled attributes if they know the mangled names.

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

<details><summary style="font-size:18px;color:Orange;text-align:left">Concurrency vs parallelism</summary>

-   [Unlocking your CPU cores in Python (multiprocessing)](https://www.youtube.com/watch?v=X7vBbelRXn0&t=572s)
-   [mCoding: Intro to async Python | Writing a Web Crawler](https://www.youtube.com/watch?v=ftmdDlwMwwQ&t=33s)
-   [How To Easily Do Asynchronous Programming With Asyncio In Python](https://www.youtube.com/watch?v=2IW-ZEui4h4&t=69s)
-   [Next-Level Concurrent Programming In Python With Asyncio](https://www.youtube.com/watch?v=GpqAQxH1Afc)

Concurrency and parallelism are two related but distinct concepts in Python, as well as in many other programming languages. They both deal with executing multiple tasks simultaneously, but they achieve this in different ways and serve different purposes. While both concurrency and parallelism involve the execution of multiple tasks simultaneously, concurrency is more about structuring your code to efficiently manage tasks, especially those that may block, while parallelism is about actually executing tasks in parallel to improve performance by utilizing multiple CPU cores or processors. The choice between concurrency and parallelism depends on the nature of the tasks you need to perform and the performance goals of your application.

-   `Concurrency`: Concurrency is a design principle that allows you to structure your code in a way that it can handle multiple tasks or operations simultaneously without necessarily running them in parallel. It's more about managing and organizing tasks efficiently, especially when dealing with tasks that may block, such as I/O operations (e.g., reading from files, making network requests). In Python, you can achieve concurrency using various techniques and libraries, including:

    -   `Threading`: Python's threading module allows you to create and manage threads. Threads can run concurrently within the same process. However, due to Python's Global Interpreter Lock (GIL), true parallelism is often limited, and threads may not take full advantage of multiple CPU cores.

    -   `Multiprocessing`: The multiprocessing module enables you to create multiple processes, each with its own Python interpreter and memory space. This allows for true parallelism, as each process can run on a separate CPU core.

    -   `Asyncio`: Python's asyncio library provides support for asynchronous programming using coroutines. It allows you to write non-blocking code that can efficiently manage and switch between multiple tasks, such as handling multiple I/O-bound operations concurrently.

-   `Parallelism`: Parallelism, on the other hand, is the actual simultaneous execution of multiple tasks on multiple CPU cores or processors, with the goal of improving performance and reducing execution time. It's often used for tasks that can be divided into smaller, independent subtasks that can run in parallel. In Python, you can achieve parallelism using:

    -   `Multiprocessing`: As mentioned earlier, the multiprocessing module can be used to create multiple processes, each of which runs in parallel on separate CPU cores.

    -   `Third-Party Libraries`: Python has several third-party libraries, such as concurrent.futures, that provide high-level interfaces for concurrent and parallel programming, making it easier to write code that can take advantage of multiple cores.

#### Thread vs Multiprocessing vs Asynchronous Programming

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

#### Global Interpreter Lock (GIL)

The Global Interpreter Lock (`GIL`) is a mutex (short for mutual exclusion) in the CPython interpreter, which is the most widely used implementation of Python. The `GIL` is a critical aspect of Python's internal design and has significant implications for how Python code runs, particularly in multithreaded programs. Here's what you need to know about the Global Interpreter Lock:

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

</details>

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

Assigned to variables.
Passed as arguments to functions.
Returned from functions.
Stored in data structures like lists or dictionaries.
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

</details>

---
