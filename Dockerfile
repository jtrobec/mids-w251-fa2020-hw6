FROM nvcr.io/nvidia/l4t-pytorch:r32.4.3-pth1.6-py3

RUN  apt-get update && apt-get install -y curl unzip cmake build-essential pkg-config libgoogle-perftools-dev libffi-dev

# Create working directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ADD  v0.1.92.zip /usr/src/app

RUN  cd /usr/src/app && \
     unzip v0.1.92.zip && \
     cd sentencepiece-0.1.92 && \
     mkdir build && \
     cd build && \
     cmake .. && \
     make -j $(nproc) && \
     make install && \
     ldconfig -v && \
     cd ../python && \
     python3 setup.py build && \
     python3 setup.py install

# Get Rust
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
RUN echo 'source $HOME/.cargo/env' >> $HOME/.bashrc

RUN  pip3 install setuptools-rust
RUN  /bin/bash -c "source $HOME/.cargo/env && pip3 install transformers"
RUN  pip3 install numpy scipy matplotlib
RUN  pip3 install pandas scikit-learn jupyter
RUN  git clone https://github.com/MIDS-scaling-up/v2 w251
