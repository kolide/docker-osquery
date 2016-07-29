FROM centos:7
MAINTAINER Zach Wasserman <zwass@kolide.co>

RUN rpm -ivh https://osquery-packages.s3.amazonaws.com/centos7/noarch/osquery-s3-centos7-repo-1-0.0.noarch.rpm

RUN yum install -y osquery

# Copy the default osquery.conf (However, a custom conf should be specified
# with `docker run -v osquery.conf:/etc/osquery.conf zwass/osqueryd`
COPY osquery.example.conf /etc/osquery/osquery.conf

CMD ["osqueryd", "--config_path=/etc/osquery/osquery.conf", "--verbose"]
