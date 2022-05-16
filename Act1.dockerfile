FROM ubuntu
ENV PATH="/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"

RUN apt update
RUN apt -y upgrade

RUN apt-get install python3-pip -y
RUN pip3 --version
RUN pip3 install virtualenv
RUN mkdir analisis
RUN cd analisis
RUN virtualenv analisis
RUN ls -la
RUN . analisis/bin/activate
RUN apt-get update
RUN apt-get install -y wget && rm -rf /var/lib/apt/lists/*
RUN wget \
    https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && mkdir /root/.conda \
    && bash Miniconda3-latest-Linux-x86_64.sh -b \
    && rm -f Miniconda3-latest-Linux-x86_64.sh 
RUN conda --version
RUN deactivate
RUN cd ..
RUN mkdir api
RUN cd api
RUN virtualenv api
RUN . api/bin/activate
RUN pip3 install Flask
RUN deactivate