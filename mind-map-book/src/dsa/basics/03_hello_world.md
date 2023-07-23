# Hello World in C++ & how it executes

```cpp
#include <iostream>

int main() {
	std::cout << "Hello World";
	return 0;
}
```

# Understanding our hello world code.

`#include <iostream>`

#include is used to include some prewritten code. #include <iostream> is used to include some pre-written code which handles input and output for our program.

`int main()`

The instructions inside this are the beginning of our code and are executed first.

`std::cout << "Hello World";`

std:: is used to use standard functions that are provided by c++. cout << is used to print anything which is on the right side of <<.

`return 0`; 

This marks the end of our main function.

# How C++ code is executed?

## Preprocessing

A preprocessor program is a program which executes before the compilation takes place. It processes preprocessor code.

In our hello world program `#include <iostream>` is preprocessor code which includes pre-written code for Input Output instructions  in our code. In other words, preprocessor code indicates certain manipulations are to be performed on the program before compilation. These manipulations typically consist of including other files or telling the compiler to define some code before compiling.

## Compilation

The compiler creates object code and stores it on disk. Object code is similar to Machine Language.

## Linking

The linker links the object code with the libraries, link all the object files required to execute our code and creates an executable file and stores it on disk.

## Loading

The loader puts the program in memory so the CPU can take each instruction and execute it.

> Although these notes are for revision and not for those who don’t know C++, I have included these introduction topics, since they are sometimes asked in interviews and stuff.
>