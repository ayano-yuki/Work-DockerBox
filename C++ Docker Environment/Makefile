SRC := $(wildcard *.cpp)
OUT := $(SRC:.cpp=)

CXXFLAGS := -Wall -O2
all: $(OUT)

%: %.cpp
	g++ $(CXXFLAGS) -o $@ $<

clean:
	rm -f $(OUT)
