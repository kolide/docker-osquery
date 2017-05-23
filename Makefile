VERSION = "latest"
# Image tags
UBUNTU14 = 'kolide/osquery'
UBUNTU16 = 'kolide/ubuntu16-osquery'
CENTOS6 = 'kolide/centos6-osquery'
CENTOS7 = 'kolide/centos7-osquery'

define build_osquery
	cd ${1} && docker build -t ${2}:latest .
	$(eval VERSION="$(shell docker run --rm ${2}:latest osqueryd --version|sed 's/osqueryd version //g')")
	docker tag ${2}:latest ${2}:${VERSION}
	docker push ${2}:latest
	docker push ${2}:${VERSION}
endef

all:
	$(call build_osquery, 'ubuntu14-osquery',${UBUNTU14})
	$(call build_osquery, 'ubuntu16-osquery',${UBUNTU16})
	$(call build_osquery, 'centos6-osquery',${CENTOS6})
	$(call build_osquery, 'centos7-osquery',${CENTOS7})

