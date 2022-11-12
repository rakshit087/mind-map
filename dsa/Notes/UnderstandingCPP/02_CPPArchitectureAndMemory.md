# Architecture

C++ is a compiled language where, the source code is first translated to object code. Each C++ source code file produces its own object code file. Because code in a file may reference code in another file, all the object code is sent to a linker which resolves any missing addresses (when different files refer to each other). Then this object code is translated into machine code (what the machine can actually execute) and one executable file is created.

# Memory

We have two type of memories in C++, stack and heap.

When we invoke a function a chunk of memory, called an activation record or stack frame, is allocated that includes all necessary things for that function: memory for the parameters, memory for locals, address of where to return when the function finishes, etc. This memory is pushed on to the run time stack, a collection of these activation records. When the function finishes, the record is popped off the stack, i.e., the memory is released, so it can be reused.

While heap is used when we dynamically allocate memory.

> This section is taken from an article I was reading, which can be read here [http://courses.washington.edu/css342/zander/css332/arch.html](http://courses.washington.edu/css342/zander/css332/arch.html)
