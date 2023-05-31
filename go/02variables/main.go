package main

import "fmt"

// public variables (can be accessed anywhere)
const gravity float32 = 9.8

func main() {
	var username = "rakshit"
	fmt.Println(username)
	// %T is used to print type, here username is of type string
	fmt.Printf("username is of type: %T\n", username)

	// boolean
	var isEligible bool = true
	fmt.Printf("isEligible is of type: %T\n", isEligible)

	// for numbers we have both signed and unsigned, int and float upto 64 bits
	var marks uint16 = 250
	fmt.Printf("marks is of type: %T\n", marks)

	// if we don't want to declare the type we have walrus operator
	totalMarks := 300.0
	fmt.Printf("totalMarks is of type: %T\n", totalMarks)
}
