FIRE_CXX ?= clang++
FIRE_CXXFLAGS ?= -O3 -std=gnu++2a -Wall -Werror

all: firebuf.a

objects = stream_buffer.o buffer.o

firebuf.a: $(objects)
	ar rcs $@ $^

%.o: %.cc *.h Makefile
	$(FIRE_CXX) $(FIRE_CXXFLAGS) -c -o $@ $<

clean:
	rm --force *.o *.a
