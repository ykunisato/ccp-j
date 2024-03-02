FROM jupyterhub/jupyterhub:latest
LABEL maintainer="Yoshihiko Kunisato <kunisato@psy.senshu-u.ac.jp>"

RUN apt -y update && apt -y upgrade
RUN apt install -y wget \
    python3 \
    python3-pip \
    python3-dev \
    crossbuild-essential-arm64 \
    git

# Intall Python packages
RUN pip3 install notebook \
    jupyterlab \
    jupyterlab-git \
    jupyter_contrib_nbextensions \
    lckr-jupyterlab-variableinspector \
    scipy \
    seaborn \
    scikit-learn \
    sympy \
    mne \
    axelrod \
    deap \
    japanize-matplotlib \
    mecab-python3 \
    unidic-lite \
    pymc3 \
    simpy \
    psychrnn \
    pyddm \
    inferactively-pymdp\
    pyhgf \
    bokeh \
    torch \
    torchvision

# Install Julia
ARG JULIA_VERSION="1.10.1"
RUN JULIA_MAJOR=`echo $JULIA_VERSION | sed -E  "s/\.[0-9]+$//g"` && \
    # ARM
    #wget https://julialang-s3.julialang.org/bin/linux/aarch64/$JULIA_MAJOR/julia-$JULIA_VERSION-linux-aarch64.tar.gz && \
    #tar -xvzf julia-$JULIA_VERSION-linux-aarch64.tar.gz && \
    # AMD
    wget https://julialang-s3.julialang.org/bin/linux/x64/$JULIA_MAJOR/julia-$JULIA_VERSION-linux-x86_64.tar.gz && \
    tar -xvzf julia-$JULIA_VERSION-linux-x86_64.tar.gz && \
    cp -r julia-$JULIA_VERSION /opt/ && \
    ln -s /opt/julia-$JULIA_VERSION/bin/julia /usr/local/bin/julia && \
    # ARM
    #rm -r julia-$JULIA_VERSION-linux-aarch64.tar.gz
    # AMD
    rm -r julia-$JULIA_VERSION-linux-x86_64.tar.gz

