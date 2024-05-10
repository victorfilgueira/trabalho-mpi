N?=10000000
PROCS?=4
REPEAT?=10
TYPE?=Naive
PROGRAM?=naive_Ssend+Recv

main:
	@rm -f $(PROGRAM)
	@mpicc -o $(PROGRAM) ./src/$(TYPE)/$(PROGRAM).c -lm
	@seq $(REPEAT) | xargs -I{} mpirun -n $(PROCS) --oversubscribe ./$(PROGRAM) $N
	@rm -f $(PROGRAM)
