# Constructors

A constructor is a special type of member function that is called automatically when an object is created.

In C++, a constructor has the same name as that of the class and it does not have a return type and is always `public`.

```cpp
class Animal {
	public:
	Animal(){
		//This is a contructor
		cout<<"I am an animal!";
	}
}
```

When an object is made of Animal, `I am an animal` will be printed on screen.

## Parameters in constructors - **Parameterised Constructor**

We can also have parameters in constructors

```cpp
class Animal {
  private:
    int legs;
    int age;

  public:
    Animal(int legs, int ags) {
      legs = legs;
      age = age;
    }
};

int main() {
  Animal a1(4, 8);
}
```

## Copy Constructors

These are used to copy one object to other.

```cpp
class Animal {
  private:
    int legs;
    int age;

  public:
    Animal(int legs, int ags) {
      legs = legs;
      age = age;
    }
		Animal(Animal &obj) {
      legs = obj.legs;
      age = obj.age;
    }
};

int main() {
  Animal animal1(4, 8);
	//This will copy animal1 to animal2
  Animal animal2 = animal1;
  return 0;
}
```