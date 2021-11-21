module skrillec_cp

import os
import io
import net

pub fn main_cp(mut conn net.TcpConn) {
	mut reader := io.new_buffered_reader(reader: conn)
	
	for {
	       conn.write_string(">>> ") or {0}
		   input_cmd := reader.read_line() or {return}
		if input_cmd == "help" {
		   help := os.read_file('/root/Skrillec-Botnet/banner/7help.txt') or {return}
		   conn.write_string(help) or {0}
		}
	}
}