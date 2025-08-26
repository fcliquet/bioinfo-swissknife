# bioinfo-swissknife

docker/apptainer container with commonly used tools

## tools available

- bazam 1.0.1 wih java 11 to run it
- bwa-mem2
- samtools
- samblaster
- sambamba

## build and push commands

```bash
# Build the container
docker build -t fcliquet/bioinfo-swissknife:latest .

# Test the container
docker run --rm fcliquet/bioinfo-swissknife:latest /opt/test_tools.sh

# Push to Docker Hub (optional)
docker push fcliquet/bioinfo-swissknife:latest

# Convert to Apptainer/Singularity
apptainer build bioinfo-swissknife.sif docker://fcliquet/bioinfo-swissknife:latest
```
