Name: @@PACKAGE_NAME@@
Version: @@PACKAGE_VERSION@@
Release: 1
Summary: @@PACKAGE_SUMMARY@

Group: @@PACKAGE_GROUP@@
License: @@PACKAGE_LICENSE@@
URL: @@PROJECT_URL@@
Packager: @@MAINTAINER_NAME@@ <@@MAINTAINER_EMAIL@@>


Source0: @@SOURCE_URL@@
BuildRoot:      %(mktemp -ud %{_tmppath}/%{name}-%{version}-%{release}-XXXXXX)

BuildRequires: @@BUILD_REQUIRES@@
Requires: @@PACKAGE_REQUIRES@@

%description
@@PACKAGE_DESCRIPTION@@

%prep
%setup -q

%build
%configure
make %{?_smp_mflags}


%install
rm -rf %{buildroot}
make install DESTDIR=%{buildroot}


%clean
rm -rf %{buildroot}

%pre

%post

%preun

%postun


%files
%defattr(-,root,root,-)
%doc


%changelog
@@PACKAGE_CHANGELOG@@

