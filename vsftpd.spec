%define rpm_name 	vsftpd_tmp
%define rpm_version 	3.0.5
%define build_time	00000000000000
Name:		%rpm_name
Version:	%rpm_version
Release:	%{build_time}%{?dist}
Summary:	Very Secure Ftp Daemon

Group:		System Environment/Daemons
License:	GPLv2 with exceptions
URL:		http://www.sangfor.com.cn
%description
 %rpm_name

%install
#SOURCE_DIR=/root/vsftpd
if [ -z "$SOURCE_DIR" ];then
    echo "must export SOURCE_DIR."
    exit 1
fi

tar -jcvf vsftpd.tar.bz2 -C $SOURCE_DIR ../vsftpd
mv %{_builddir}/vsftpd.tar.bz2 %{_sourcedir}
cp $SOURCE_DIR/vsftpd.spec.in %{_specdir}
sed -i "s/BUILD_TIME/%build_time/g"  %{_specdir}/vsftpd.spec.in
rpmbuild -ba --define "RPM_EPOCH %{RPM_EPOCH}" \
             --define "RPM_VERSION %{RPM_VERSION}" \
			 --define "RPM_RELEASE %{RPM_RELEASE}" %{_specdir}/vsftpd.spec.in

