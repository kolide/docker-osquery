FROM ubuntu:14.04
MAINTAINER Zach Wasserman <zwass@kolide.co>

# Get add-apt-repository
RUN apt-get update \
  && apt-get install -y software-properties-common \
  && apt-get install apt-transport-https

# Add the apt repository for osquery packages
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 1484120AC4E9F8A1A577AEEE97A80C63C9D8B80B \
  && add-apt-repository "deb [arch=amd64] https://osquery-packages.s3.amazonaws.com/trusty trusty main"

# Install osquery
RUN apt-get update \
  && apt-get install -y osquery

RUN rm -rf /var/lib/apt/lists/*

# Copy the default osquery.conf (However, a custom conf should be specified
# with `docker run -v osquery.conf:/etc/osquery.conf zwass/osqueryd`
COPY osquery.example.conf /etc/osquery/osquery.conf

CMD ["osqueryd", "--config_path=/etc/osquery/osquery.conf", "--verbose"]
