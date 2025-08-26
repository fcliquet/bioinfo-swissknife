FROM continuumio/miniconda3:latest

# Set working directory
WORKDIR /opt

# Add bioconda channels
RUN conda config --add channels defaults && \
    conda config --add channels bioconda && \
    conda config --add channels conda-forge

# Install all required tools in one go
RUN conda install -y \
    bazam=1.0.1 \
    bwa-mem2 \
    samtools \
    samblaster \
    sambamba \
    openjdk=11 && \
    conda clean -a

# Set PATH to include conda binaries
ENV PATH="/opt/conda/bin:${PATH}"

# Create a simple test script
RUN echo '#!/bin/bash\necho "Testing installed tools:"\necho "Java: $(java -version 2>&1 | head -1)"\necho "BWA-MEM2: $(bwa-mem2 version 2>&1 | head -1)"\necho "Samtools: $(samtools --version | head -1)"\necho "Samblaster: $(samblaster --version 2>&1)"\necho "Sambamba: $(sambamba --version 2>&1 | head -1)"\necho "Bazam: $(java -jar /opt/conda/share/bazam*/bazam.jar --version 2>&1 | head -1)"' > /opt/test_tools.sh && \
    chmod +x /opt/test_tools.sh

# Set default command
CMD ["/bin/bash"]
