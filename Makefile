CC = gcc
CFLAGS = -Wall -Wextra -O2
LDLIBS = -lm

run: challenge.c
	$(CC) $(CFLAGS) -o $@ $< $(LDLIBS)

.PHONY: clean
clean:
	rm -f run
