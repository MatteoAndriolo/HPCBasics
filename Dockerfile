# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:3.10-slim

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y wget

# Install pip requirements
COPY requirements.yaml .
# RUN python -m pip install -r requirements.txt

# RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh \
#   && /bin/bash ~/miniconda.sh -b -p /opt/conda \
#   && rm ~/miniconda.sh \
#   && /opt/conda/bin/conda init bash \
#   && . ~/.bashrc

# read requirement.txt file in con
# RUN /opt/conda/bin/conda install --file requirements.yaml --channel conda-forge --channel pypi
#RUN /opt/conda/bin/conda update -y -n base && \
#  /opt/conda/bin/mamba install -y -n base conda-libmamba-solver && \
#  conda config --set solver libmamba
RUN /opt/conda/bin/mamba install --channel conda-forge --channel pypi \
  matplotlib \
  seaborn \
  numpy \
  pandas 
RUN pip install confidenceinterval 
RUN pip install scikit-learn==1.3.2
RUN pip install xgboost 
RUN pip install scipy==1.11.2 
RUN pip install tensorflow

WORKDIR /app
# COPY . /app

# Creates a non-root user with an explicit UID and adds permission to access the /app folder
# For more info, please refer to https://aka.ms/vscode-docker-python-configure-containers
# RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
# USER appuser

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
CMD ["python"]
