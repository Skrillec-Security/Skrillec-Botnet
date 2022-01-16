/*
		Skrillec Function Debugger
*/

import os
import crud
import custom_fn

fn main() {
	println("Welcome to Skrillec Debugger. This script is used to test functions from Skrillec Build!")
	for {
		input_cmd := os.input(">>> ")
		match input_cmd {
			custom_fn.match_contain(input_cmd, "help") {
				println("worked")
			} 
			"test" {
				println("worked")
			}
			else {
				println("Command/Function not found!")
			}
		}
	}
}