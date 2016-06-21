CXX       = g++
CXXFLAGS  = -Wall -O3 -DHAVE_INLINE -static-libstdc++ -fopenmp
LDFLAGS   = -lgsl -lgslcblas -fopenmp
MAIN      = EMu
MODEL     = MutSpecEM
PREPARE   = EMu-prepare
PROGRAMS  = $(MAIN) $(PREPARE)
OBJECTS   = $(MODEL).o $(MAIN).o
DESTDIR  ?= /usr

all: $(PROGRAMS)
	

$(MAIN): $(OBJECTS)
	$(CXX) $(CXXFLAGS) $(OBJECTS) -o $(MAIN) $(LDFLAGS)

$(PREPARE): $(PREPARE).o
	$(CXX) $(CXXFLAGS) $(PREPARE).o -o $(PREPARE) $(LDFLAGS)

$(PREPARE).o: $(PREPARE).cpp
	$(CXX) $(CXXFLAGS) -c $(PREPARE).cpp

$(MODEL).o: $(MODEL).cpp $(MODEL).h
	$(CXX) $(CXXFLAGS) -c $(MODEL).cpp

$(MAIN).o: $(MAIN).cpp
	$(CXX) $(CXXFLAGS) -c $(MAIN).cpp

install: $(PROGRAMS)
	mkdir -p $(DESTDIR)/bin
	install -p $(PROGRAMS) $(DESTDIR)/bin

clean:
	rm -f *.o
	rm -f $(PROGRAMS)

