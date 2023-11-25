export SOURCE_DIR="$1"
spec_file="$1/*.spec"
RPM_EPOCH=1
RPM_VERSION="3.0.5"
RPM_RELEASE=`date +'%Y%m%d%H%M%S'`

rpmbuild -bb ${spec_file} \
  --define "RPM_EPOCH ${RPM_EPOCH}" \
  --define "RPM_VERSION ${RPM_VERSION}" \
  --define "RPM_RELEASE ${RPM_RELEASE}"