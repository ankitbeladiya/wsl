FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y --no-install-recommends install \
    ca-certificates \
    wget
RUN apt-get clean && apt-get autoremove

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh --no-check-certificate
RUN bash ~/miniconda.sh -b -p $HOME/miniconda3
RUN echo 'source $HOME/Miniconda3/bin/activate' >> ~/.bashrc

ENV PATH /root/miniconda3/bin:$PATH

RUN mkdir -p ~/.jupyter
COPY jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py

COPY requirements.txt .
RUN pip install --upgrade pip setuptools && \ 
    pip install -r requirements.txt --no-cache-dir

RUN mkdir -p /root/work

CMD ["jupyter", "lab", "--no-browser", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''"]
