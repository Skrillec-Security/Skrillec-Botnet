module skrillec_cp

import os
import net

pub fn main_cp() {
	for {
		mut input_cmd := os.input(">>> ")
		mut input_args := []string
		if input_cmd.contains(" ") { input_args = input_cmd.split(" ") }

		mut cnc_toggle := false
		if input_cmd == "c" {
			
		}
	}
}