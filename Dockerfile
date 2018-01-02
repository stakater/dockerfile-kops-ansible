FROM williamyeh/ansible:alpine3

RUN pip install boto

RUN mkdir -p /aws && \
    apk -Uuv add git openssh groff less python py-pip curl jq unzip && \
    curl -LO --show-error https://github.com/kubernetes/kops/releases/download/1.8.0/kops-linux-amd64 && \
    mv kops-linux-amd64 /usr/local/bin/kops && \
    chmod +x /usr/local/bin/kops && \
    curl -LO --show-error https://storage.googleapis.com/kubernetes-release/release/v1.8.0/bin/linux/amd64/kubectl && \
    mv kubectl /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl && \
    wget https://releases.hashicorp.com/terraform/0.11.1/terraform_0.11.1_linux_amd64.zip && \
    unzip terraform_0.11.1_linux_amd64.zip && \
    mv terraform /usr/local/bin/ && \
    rm terraform_0.11.1_linux_amd64.zip && \
    pip install awscli boto && \
    apk --purge -v del py-pip && \
    rm /var/cache/apk/*
