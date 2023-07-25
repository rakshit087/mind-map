# Classes & Objects

**Classes** are blueprints that defines the variables and the methods common to all objects of a certain kind. 

For example, the object can be an Employee. All employees have certain common properties that are required for our program, like age, name, company etc

**Objects** are an instance of that class, for example if we have a class Employee with properties like Name, Company and Age, its object will be a specific employee with a  specific name, company and age.

## Defining a class & Object

```cpp
#include <iostream>
using namespace std;

//Defining a class
class Employee {
	//Properties of the class
	string Name;
	string Company;
	int Age;
	//Methods of the class
	int calculateSalary(int serviceYears) {
		return 100000*serviceYears;
	}
}

int main() {
	//Making an object
	Employee e1;
	//Accessing Properties of object
	cout<<e1.Name;
	//Accessing Methods of object
	cout<<e1.calculateSalary(2);
}
```

## Example from Programwiz

```cpp
// Program to illustrate the working of
// objects and class in C++ Programming

#include <iostream>
using namespace std;

// create a class
class Room {

   public:
    double length;
    double breadth;
    double height;

    double calculateArea() {
        return length * breadth;
    }

    double calculateVolume() {
        return length * breadth * height;
    }
};

int main() {

    // create object of Room class
    Room room1;

    // assign values to data members
    room1.length = 42.5;
    room1.breadth = 30.8;
    room1.height = 19.2;

    // calculate and display the area and volume of the room
    cout << "Area of Room =  " << room1.calculateArea() << endl;
    cout << "Volume of Room =  " << room1.calculateVolume() << endl;

    return 0;
}
```