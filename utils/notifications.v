module utils

import os
import net

pub struct NotificationSys {
	pub mut:
		user			string
		ip				string
		cmd				string
		fmsg			string
		notificate_msg	string
}

pub fn (mut n NotificationSys) set_info(user string, ip string, cmd string, fmsg string, notificate_msg string) {
	n.user = user
	n.ip = ip 
	n.cmd = cmd
	n.fmsg = fmsg
	n.notificate_msg = notificate_msg
}

pub fn notificate(mut n NotificationSys) {
	mut current_time := os.execute("date +'%m/%d/%y-%H:%m'").output // Current Time
	mut output := "[Action/CMD]: ${n.cmd}| [Timestamp]: ${current_time}\r\n" // Outputing Action and Timestamp
	output += "[User]: ${n.user} | [IP]: ${n.ip}\r\n"
	if (n.fmsg).len > 0 {
		output += "[Message]: ${n.fmsg}"
	}
	n.reset_info()
}

pub fn (mut n NotificationSys) reset_info() {
	n.user = ""
	n.ip = "" 
	n.cmd = ""
	n.fmsg = ""
	n.notificate_msg = ""
}