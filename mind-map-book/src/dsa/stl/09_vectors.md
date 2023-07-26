# Vectors in C++

In C++, vectors are used to store elements of similar data types. However, unlike arrays, the size of a vector can grow dynamically.

Vectors are part of the C++ Standard Template Library. To use vectors, we need to include the `vector` header file in our program.

## Declaraton

```cpp
vector<int> v; //Declare an empty vector of int type
vector<int> vector1 = {1, 2, 3, 4, 5}; //Initialize with 1,2,3,4,5
vector<int> vector2 {1, 2, 3, 4, 5}; //Initialize with 1,2,3,4,5
vector<int> vector3(5, 12); //⭐ Initialize with 12,12,12,12,12
vector<int, vector<int>> vector2D(5, vector<int>(10,0)) //Initialize a 5x10 Vector with 0s 
```

## Adding elements to vector

```cpp
vector<int> num {1, 2, 3, 4, 5};
num.push_back(6);
```

**Note**: We can also use the `insert()` and `emplace()` functions to add elements to a vector.

## Accessing Elements

```cpp
vector<int> num {1, 2, 3, 4, 5};
cout << "Element at Index 0: " << num.at(0) << endl;
```

**Note:** Like an [array](https://www.programiz.com/cpp-programming/arrays), we can also use the square brackets `[]` to access vector elements. For example,

```cpp
vector<int> num {1, 2, 3};
cout << num[1];  // Output: 2
```

However, the `at()` function is preferred over `[]` because `at()` throws an exception whenever the vector is out of bound, while `[]` gives a garbage value

## Changing Elements

```cpp
num.at(1) = 9;
```

## Deleting Last Element

```cpp
v.pop_back()
```