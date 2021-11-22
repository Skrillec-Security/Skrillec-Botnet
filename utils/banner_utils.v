module utils

import os
import net
import utils

pub struct CurrentLine {
	pub mut:
		line	int
}

pub fn output_banner(mut socket net.TcpConn) {
	mut banner_file := os.read_file(os.getwd() + "/banners/${file}.txt") or { "" }
	mut config_file := os.read_file(os.getwd() + "/assets/config.skrillec") or { "" }
	_, output_position := utils.parse(config_file, "CNC_Output", "cnc_output_position")
	if banner_file.contains("\n") {
		for i in banner_file.split("\n") {
			
		}
	}
}