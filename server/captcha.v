module server

import rand
import io
import net
import os

// pub fn captcha(mut socket net.TcpConn) {
// 	num := rand.int_in_range(1, 1000)
//     lol := http.get_text("https://artii.herokuapp.com/make?text=$num&font=drpepper")
    
//     socket.write_string(output) or {0}
//     socket.write_string("\r\n >>> [38;2;60;195;255m[38;2;55;200;255m[38;2;50;205;255m[38;2;45;210;255m[38;2;40;215;255m[38;2;35;220;255m") or {0}
//     data := reader.read_line() or {return}
    
//     if data.contains('$num'){
//         conn.write_string("Captcha completed!\r\n") or {0}
//         println('someone completed the captcha') 
//     }
// 	else
// 	{
//         conn.write_string("Invalid captcha!") or {0}
//         println('someone failed the captcha')
//     }
// }