#!/bin/bash

#shellcheck disable=SC2010
LATEST_VERSION=$(ls -1 /opt/intel/oneapi/compiler/ | grep -v latest | sort | tail -1)
# shellcheck source=/dev/null
source /opt/intel/oneapi/compiler/"$LATEST_VERSION"/env/vars.sh

echo -n "mpif90?   "
echo $(which mpif90)
echo -n "mpiifort? "
echo $(which mpiifort)
echo -n "gfortran? "
echo $(which gfortran)
echo -n "ifort?    "
echo $(which ifort)
echo -n "ifx?      "
echo $(which ifx)

ifx helloworld.f90 -o helloworld_serial

./helloworld_serial

mpiifort helloworld_mpi.f90 -o helloworld_mpi

mpirun -np 2 helloworld_mpi
