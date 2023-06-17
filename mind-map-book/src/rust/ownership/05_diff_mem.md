# Heap vs Stack vs Static Memory

**`Static Memory`**

- Static memory is a type of memory that is allocated at compile-time.
- It is used to store data that will not change during the execution of the program.
- static variables, string literals, program’s binary are stored here.
- Static memory is typically allocated in a section of memory known as the data segment.
- Since static memory is allocated at compile-time, it is not possible to dynamically allocate or deallocate memory in this segment at runtime.
- Cleans up after the program’s execution.

`Stack Memory`

- contains function arguments, local variables,
- The stack stores values in the order it gets them and removes the values in the opposite order. This is referred to as *last in, first out*.
- Used for storing function call parameters and local variables.
- Limited in size and has a fixed size for each data item.
- Data on the stack must have a known, fixed size.
- Accessing data on the stack is faster than accessing data on the heap.
- Works well for data that needs to be accessed sequentially and is close to other data.

`Heap Memory`

- Stores data in a less organized manner.
- Used for dynamically allocating memory at runtime.
- Allocating on the heap involves requesting a certain amount of space and receiving a pointer to that location.
- Can store data with an unknown or variable size at compile time.
- Requires the use of pointers to access data on the heap.
- Accessing data on the heap is slower than accessing data on the stack due to pointer indirection.
- Can accommodate larger amounts of data and data structures.
- Allows for flexible memory management but requires manual deallocation to avoid memory leaks.