# Access Modifiers
A class can have two sections, public and private, private section can be accessed only by the class itself, while, public can be accessed anywhere. 

```cpp
class Animal {
	private:
		int age;
		int legs;
	
	public:
		int getAge() {
			return age;
		}
}
```

Here, age and legs cannot be accessed directly since it’s private. So object cannot directly use `ani.age;` . While `getAge()` is public thus can be accessed anywhere.