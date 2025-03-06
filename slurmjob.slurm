#!/bin/bash

#SBATCH --job-name=slurmjob
#SBATCH --output=slurmjob.out
#SBATCH --error=slurmjob.err
#SBATCH --time=00:01:00
#SBATCH --partition=allgroups
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G

SCRIPT="/bin/bash -c 'echo Hello, World!'"
SCRIPT="python script.py"

singularity exec --bind .:/app container.sif $SCRIPT
 