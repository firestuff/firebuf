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

asan:
	$(MAKE) clean
	FIRE_CXXFLAGS="-O1 -g -fsanitize=address -fno-omit-frame-pointer -std=gnu++2a -Wall -Werror" $(MAKE) all
