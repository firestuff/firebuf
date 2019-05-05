#include "stream_buffer.h"

namespace firebuf {

StreamBuffer::StreamBuffer(int sock, size_t size)
		: Buffer(size),
		  sock_(sock) {}

bool StreamBuffer::Refill() {
	auto read_len = read(sock_, WritePtr(), WriteMaxLen());
	if (read_len == 0) {
		return false;
	}
	Wrote(read_len);
	return true;
}

} // namespace firebuf
