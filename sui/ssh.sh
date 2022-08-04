#!/bin/bash
source setenv.sh

# SSH to the instance
gcloud beta compute ssh "$name" --zone "$zone"
