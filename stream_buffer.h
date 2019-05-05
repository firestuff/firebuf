#pragma once

#include "buffer.h"

namespace firebuf {

class StreamBuffer : public Buffer {
  public:
	StreamBuffer(int sock, size_t size);

	[[nodiscard]] bool Refill();

  private:
  	int sock_;
};

} // namespace firebuf
