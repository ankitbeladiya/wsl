FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y --no-install-recommends install \
    ca-certificates \
    wget \
    apt-get clean && apt-get autoremove

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh --no-check-certificate
RUN bash ~/miniconda.sh -b -p $HOME/Miniconda3
RUN echo 'source $HOME/Miniconda3/bin/activate' >> ~/.bashrc

ENV PATH /root/miniconda3/bin:$PATH

RUN mkdir -p ~/.jupyter
COPY jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py

COPY requirements.txt
RUN pip install --upgrade pip setuptools && pip install -r requirements.txt --no-cache-DEBIAN_FRONTEND

RUN mkdir -p /root/work

CMD ["jupyter", "lab", "--no-browser", "--NotebookApp.token=''", "--NotebookApp.password=''"]
