ASFLAGS+=-w
CFLAGS+=-O1 -masm=intel -fno-asynchronous-unwind-tables

BINS=fibonacci
all: $(BINS)
fibonacci: fibonacci.o

.PHONY: clean debug profile run val

debug: CFLAGS+=-g
debug: all

profile: CFLAGS+=-pg
profile: LDFLAGS+=-pg
profile: all

clean:
	$(RM) $(BINS) *.o

run:
	./$(BINS)

val:
	valgrind --leak-check=full ./$(BINS)

%.s: %.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -S -o $@ $^
