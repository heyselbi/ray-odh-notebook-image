FROM quay.io/thoth-station/s2i-minimal-py38-notebook:latest

# Install: torch (v1.12), ray[data,default,k8s,serve,train,tune] (v1.13.0) and others
COPY requiremnts.txt requiremnts.txt

RUN pip install -r requiremnts.txt

RUN pip uninstall pickle5 -y 

# Pull notebooks in
ADD codeflare/ /home/codeflare

# Install codeflare-cli and other libraries
RUN pip install codeflare-sdk==0.1.6 \
				datasets==2.6.1 \
				transformers==4.23.1 \
				evaluate==0.3.0 \
				git+https://github.com/atinsood/torchx.git@static_backend_no_etcd_rank_fixed_port_pod_ip_v2
