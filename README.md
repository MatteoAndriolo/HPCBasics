# Building imagine
## Using docker 
Look at `runthis.sh`

1. Build the image
2. Build sif container
3. sen container to server

# Login to server
`ssh username@login.dei.unipd.it`

`cd <...>` change directory

# Submitting Job
## 1. Create slurm job file
...

## 2. Submit job
`sbatch job.sh`

# Slurm useful commands
- `squeue -u username` - show jobs of a specific user
- `scancel jobid` - cancel a job

# Note
- 