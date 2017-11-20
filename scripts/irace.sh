#!/bin/sh
#SBATCH -J PCGP
#SBATCH -N 1
#SBATCH -n 20
#SBATCH --ntasks-per-node=1
#SBATCH --ntasks-per-core=1
#SBATCH --mail-user=dennisgwilson@gmail.com
#SBATCH --mail-type=ALL

CGP=/users/p16043/wilson/CGP.jl
WORK_DIR=/tmpdir/wilson/dennis/$SLURM_JOB_ID
DATA_DIR=/tmpdir/wilson/data/julia

export IRACE_HOME="/home/d9w/R/x86_64-pc-linux-gnu-library/3.4/irace"
export PATH=$IRACE_HOME/bin:$PATH
export R_LIBS="/home/d9w/R/x86_64-pc-linux-gnu-library/3.4":$R_LIBS

mkdir -p $WORK_DIR
cp -r $CGP/cfg/* $WORK_DIR/
cp -r $CGP/tuning/* $WORK_DIR/
cp -r $CGP/experiments/classify.jl $WORK_DIR/
cd $WORK_DIR

srun irace --parallel 20 2>&1 > irace.log