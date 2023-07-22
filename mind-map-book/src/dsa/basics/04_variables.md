# Variables and Data Types

# Variables and Data Types in C++

C++ is a strongly typed language, which means that every variable must be declared with a specific data type before it can be used. In this document, we will discuss the different data types and how to declare variables in C++.

## Data Types

### Basic Data Types

C++ has several basic data types:

- **int**: used to store whole numbers (positive or negative) without decimals.
- **double**: used to store floating-point numbers with decimals.
- **char**: used to store single characters (letters, numbers, symbols).
- **bool**: used to store true or false values.

### Derived Data Types

C++ also has several derived data types:

- **arrays**: used to store multiple values of the same data type in a single variable.
- **pointers**: used to store memory addresses.
- **references**: used to refer to a variable by another name.
- **functions**: used to group a set of statements together to perform a specific task.

## Declaring Variables

To declare a variable in C++, you need to specify the data type and give it a name. Here are some examples:

```
int age;
double price;
char grade;
bool is_valid;

```

You can also initialize a variable when you declare it:

```
int age = 30;
double price = 19.99;
char grade = 'A';
bool is_valid = true;

```

## Code Snippets

### Example 1: Adding Two Numbers

```
#include <iostream>

using namespace std;

int main() {
    int num1, num2, sum;

    cout << "Enter two numbers: ";
    cin >> num1 >> num2;

    sum = num1 + num2;

    cout << "Sum = " << sum;

    return 0;
}

```

### Example 2: Finding the Maximum of Two Numbers

```
#include <iostream>

using namespace std;

int main() {
    int num1, num2, max_num;

    cout << "Enter two numbers: ";
    cin >> num1 >> num2;

    max_num = (num1 > num2) ? num1 : num2;

    cout << "Maximum number = " << max_num;

    return 0;
}

```

## Conclusion

In this document, we discussed the different data types in C++ and how to declare variables. We also provided some code snippets to demonstrate how to use variables and data types in C++.