# Use Red Hat UBI 9 base image
FROM registry.access.redhat.com/ubi9/ubi

LABEL maintainer="midu@redhat.com"

# Fix package conflict by allowing erasing coreutils-single
RUN dnf install -y --allowerasing bc coreutils && \
    dnf clean all

WORKDIR /opt/app

COPY node-print-time.sh .

RUN chmod +x node-print-time.sh

CMD ["./node-print-time.sh"]
