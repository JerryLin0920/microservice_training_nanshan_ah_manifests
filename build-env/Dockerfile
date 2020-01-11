FROM ubuntu:bionic

# install requires packages
RUN apt-get update && \
    apt-get install -y ca-certificates make curl && \
    apt-get clean

# IBM bx pr
COPY icp-linux-amd64 /
RUN curl -fsSL https://clis.ng.bluemix.net/install/linux | sh && \
    bx plugin install /icp-linux-amd64

# kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl && \
    mv ./kubectl /usr/local/bin && \
    chmod +x /usr/local/bin/kubectl

# kustomize
RUN curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash && \
    mv ./kustomize /usr/local/bin
