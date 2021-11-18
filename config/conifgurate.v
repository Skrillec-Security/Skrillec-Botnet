module config

import os

pub fn get_net_info() []string {
	mut file_d := os.read_file(os.getwd() + "/assets/config.skrillec") or { "" }
}