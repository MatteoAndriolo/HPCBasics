#!/bin/bash

SIFNAME=container.sif
COMMAND="-c \"import tensorflow as tf; print(tf.config.list_physical_devices('GPU'))\""

singularity run ${SIFNAME} ${COMMAND}


