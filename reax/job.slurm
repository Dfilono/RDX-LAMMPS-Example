#!/usr/bin/env bash
#SBATCH --job-name=MeltPOCB   # The job name in crc-squeue.py
#SBATCH --output=melt.out # Standard out and error
                               # will be written to this file
#SBATCH --time=24:00:00         # How long should this job run?
                               # Format: [days-]hours:minutes:seconds
#SBATCH --nodes=1              # Number of nodes needed
#SBATCH --ntasks-per-node=1   # Number of MPI tasks per node
                               # pro tip: If you don't know what
                               # this means, leave it at 1
#SBATCH --cluster=smp    # Cluster you need: smp, mpi, gpu, htc
                               # Exclude this to get default cluster
                               # H2P - smp
                               # HTC - htc
#SBATCH --account=jkeith
#SBATCH --mail-user=dof13@pitt.edu    # Optional, send yourself an email if
                               # your job ends or fails
#SBATCH --mail-type=END,FAIL   # Pair with --mail-user

module purge
module load intel/2018.2.199
module load intel-mpi/2018.2.199
module load lammps/16Mar18

mpirun -np $SLURM_NTASKS lmp_mpi -in in.reax.rdx >& output
