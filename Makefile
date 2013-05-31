.PHONY : run

all :
	(test -d mpidriver || git clone https://github.com/rajamony/mpidriver.git mpidriver) && (cd mpidriver; git reset --hard; git pull -f; make all)

run : 
	rm -f unhappy
	env GOMP_CPU_AFFINITY="0-15:1" OMP_NUM_THREADS=8 mpirun -np 1 ./mpidriver/driver -d -t memory -o "-n2 -r10000 -e13"
