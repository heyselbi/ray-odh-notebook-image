FROM quay.io/thoth-station/s2i-minimal-py38-notebook:latest

COPY requiremnts.txt requiremnts.txt 

RUN pip install -r requiremnts.txt

RUN pip uninstall pickle5 -y 