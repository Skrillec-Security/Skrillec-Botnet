module utils

import os

pub fn notificate(user string, cmd string, text string, mut s server.Server) {
	//get the current time
	mut current_time := os.execute("date +'%m/%d/%y-%H:%m'").output
	mut current_userip := s.clients.get_ip(user)
	mut output := "[Action/CMD]: ${cmd}| [Timestamp]: ${current_time}\r\n"
	output += "[User]: ${user} | [IP]: ${current_userip}\r\n"
	output += "[Message]: ${s.File}"
}