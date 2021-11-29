import net
import io

fn main() {
	mut conn := net.dial_tcp('${os.args[1]}:${os.args[2]}') ?
	mut encryption_key := ""
	defer {
		conn.close() or {}
	}

	println(' peer: $conn.peer_addr()')
	println('local: $conn.addr()')

	conn.write_string('') ?
	// Read all the data that is waiting
	result := io.read_all(reader: conn) ?
	// Cast to string and print result
	println(result.bytestr())
}