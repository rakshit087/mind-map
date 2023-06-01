package main

import (
	"bufio"
	"fmt"
	"os"
)

func main() {
	reader := bufio.NewReader(os.Stdin)
	fmt.Println("Please input your name")

	// using comma ok syntax
	// we don't have try catch in GoLang so we use comma okay syntax, where error is stored as a var
	input, err := reader.ReadString('\n')
	if err != nil {
		fmt.Println(err)
	} else {
		fmt.Println("Your name is ", input)
	}

}
