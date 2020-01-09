# VERSION 0.0.1
# AUTHOR: Tylar "7yl4r" Murray
# DESCRIPTION: Basic WV image processing.
# BUILD: docker build --rm -t 7yl4r/wv_img_proc_docker .
# SOURCE: https://github.com/7yl4r/wv_img_proc_docker

FROM geographica/gdal2:2.4.2
LABEL maintainer="7yl4r"

COPY script/entrypoint.sh /entrypoint.sh

# prereqs
RUN apt-get update && apt-get install -y git

# install
RUN git clone -b master https://github.com/7yl4r/imagery_utils.git

ENTRYPOINT ["/entrypoint.sh"]
