# Use the NVIDIA PyTorch container as the base image
FROM nvcr.io/nvidia/pytorch:21.05-py3

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Clone the Swin-Transformer repository
RUN git clone https://github.com/microsoft/Swin-Transformer.git

# Set the working directory
WORKDIR /Swin-Transformer

# Install PyTorch, torchvision, and CUDA
RUN conda install pytorch==1.8.0 torchvision==0.9.0 cudatoolkit=10.2 -c pytorch -y

# Install timm
RUN pip install timm==0.4.12 opencv-python==4.4.0.46 termcolor==1.1.0 yacs==0.1.8 pyyaml scipy

# Install fused window process for acceleration
RUN cd kernels/window_process && \
    python setup.py install

# Default command
CMD ["/bin/bash"]
