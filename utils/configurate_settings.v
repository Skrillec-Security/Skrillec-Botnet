module utils

import os
import utils

pub fn grab_port() string {
	mut file_d := os.read_file(os.getwd() + "/assets/config.skrillec") or { "" }
	_, p := utils.parse(file_d, "Net_Info", "net_port")
	return p
}