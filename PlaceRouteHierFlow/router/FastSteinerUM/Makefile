# Needs CXX, CXXFLAGS, and LDFLAGS

%.o : %.cxx
	$(CXX) $(CXXFLAGS) -c $<

#DBG_FLAGS  = -DDEBUG
#DBG_FLAGS  = -DDEBUG -g
#DBG_FLAGS  = -DDEBUG -DDEBUG2
#DBG_FLAGS  = -DDEBUG -DDEBUG2 -g

SRCS0 = unixtimer.cxx err.cxx random.cxx neighbors.cxx heap.cxx mst2.cxx stnr1.cxx triples.cxx
OBJS0 = $(SRCS0:.cxx=.o)

new: libsteiner.a steiner gen

steiner: main.o libsteiner.a
	$(CXX) -o $@ $^ $(LDFLAGS)

gen: gen.o libsteiner.a
	$(CXX) -o $@ $^ $(LDFLAGS)

libsteiner.a: $(OBJS0)
	ar  -r -o $@ $^

clean:
	rm -f *.o *.a
	rm -f gen steiner
	rm -f core
