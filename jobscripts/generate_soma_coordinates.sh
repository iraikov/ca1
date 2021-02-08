#!/bin/bash
#
#SBATCH -J generate_soma_coordinates_CA1
#SBATCH -o ./results/generate_soma_coordinates_CA1.%j.o
#SBATCH -N 1
#SBATCH --ntasks-per-node=56
#SBATCH -p normal      # Queue (partition) name
#SBATCH -t 1:30:00
#SBATCH --mail-user=ivan.g.raikov@gmail.com
#SBATCH --mail-type=END
#SBATCH --mail-type=BEGIN
#

module load python3
module load phdf5

set -x

export NEURONROOT=$SCRATCH/bin/nrnpython3_intel19
export PYTHONPATH=$HOME/model:$NEURONROOT/lib/python:$SCRATCH/site-packages/intel19:$PYTHONPATH


ibrun -n 4 python3 ./scripts/generate_soma_coordinates.py -v \
    --config=Full_Scale.yaml \
    --types-path=./datasets/ca1_h5types.h5 \
    --output-path=$SCRATCH/CA1_Full_Scale_coords_20210204.h5 \
    --output-namespace='Generated Coordinates' 




