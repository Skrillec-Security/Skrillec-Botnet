module skrillec_cp

import os

pub fn main_cp() {
	for {
		mut input_cmd := os.input(">>> ")
		if input_cmd == "help" {
		   help := os.read_file('/root/Skrillec-Botnet/banner/7help.txt')
		   println(help)
		}
	}
}