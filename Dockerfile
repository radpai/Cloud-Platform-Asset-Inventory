FROM alpine:3.13

# apk add installs the following
RUN \
 apk add \
   ansible \
   py3-pip \
   py3-boto \
   py3-dateutil \
   py3-httplib2 \
   py3-jinja2 \
   py3-paramiko \
   py3-setuptools \
   py3-yaml \
   python3 && \
 pip3 install --upgrade pip

RUN pip3 install boto3 requests google-auth

# Makes the Ansible directories
RUN mkdir /etc/ansible /ansible

# Makes a directory for ansible playbooks
RUN mkdir -p /ansible/playbooks

# Makes the playbooks directory the working directory
WORKDIR /ansible/playbooks

RUN ansible-galaxy collection install amazon.aws
RUN ansible-galaxy collection install azure.azcollection --force

COPY . .

RUN pip3 install -r requirements-azure.txt

RUN echo '* * * * * ansible-inventory --inventory /ansible/playbooks/inventories/aws/dynamic_aws_ec2.yml --list --output /usr/src/app/inventory/aws.yml' >> /var/spool/cron/crontabs/root
RUN echo '* * * * * ansible-inventory --inventory /ansible/playbooks/inventories/azure/dynamic_azure_rm.yml --list --output /usr/src/app/inventory/azure.yml' >> /var/spool/cron/crontabs/root
RUN echo '* * * * * ansible-inventory --inventory /ansible/playbooks/inventories/gcp/dynamic.gcp.yml --list --output /usr/src/app/inventory/gcp.yml' >> /var/spool/cron/crontabs/root

CMD ["sh", "-c", "crond && sleep infinity"]
