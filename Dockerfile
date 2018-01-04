FROM williamyeh/ansible:alpine3

RUN pip install boto

RUN mkdir -p /aws && \
    apk -Uuv add git openssh groff less python py-pip curl jq && \
    curl -LO --show-error https://github.com/kubernetes/kops/releases/download/1.7.1/kops-linux-amd64 && \
    mv kops-linux-amd64 /usr/local/bin/kops && \
    chmod +x /usr/local/bin/kops && \
    curl -LO --show-error https://storage.googleapis.com/kubernetes-release/release/v1.7.12/bin/linux/amd64/kubectl && \
    mv kubectl /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl && \
    pip install awscli boto && \
    apk --purge -v del py-pip && \
    rm /var/cache/apk/*
