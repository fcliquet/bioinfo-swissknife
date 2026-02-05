# bioinfo-swissknife

docker/apptainer container with commonly used tools

## tools available

### Bioinformatics Tools

- bazam 1.0.1 with java 1.8 to run it
- bwa-mem2
- samtools
- bcftools
- samblaster
- sambamba

### Python Environment

- Python 3.12
- pandas
- numpy
- matplotlib
- scipy
- reportlab
- pysam
- pywombat 1.2.1 (PyPI)
- pyliftover (PyPI)

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

## github automated workflow

The image is automatically built and pushed to the docker hub: [here](https://hub.docker.com/repository/docker/fcliquet/bioinfo-swissknife/general).
