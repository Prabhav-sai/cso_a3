all: q4 q5

q4:
	gcc q4/q4.c q4/q4.s -o q4ans

q5:
	gcc q5/q5.c q5/q5.s -o q5ans

clean:
	rm -f q4 q5