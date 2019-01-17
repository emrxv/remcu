#CC		= g++
CC		= clang-6.0
CFLAGS		= -g -c -Wall -std=c++11
LDFLAGS		= -lstdc++
SOURCES		= test.cpp tcpstream.cpp tcpconnector.cpp ocdcommand.cpp unixnet.cpp addressintercept.cpp
INCLUDES	= -I.
OBJECTS		= $(SOURCES:.cpp=.o)
TARGET		= test

all: $(SOURCES) $(TARGET)

$(TARGET): $(OBJECTS) 
	$(CC) $(LDFLAGS) $(OBJECTS) -o $@

.cpp.o:
	$(CC) $(CFLAGS) $(INCLUDES) $< -o $@

clean:
	rm -rf $(OBJECTS) $(TARGET)

