platform "sles-11-x86_64" do |plat|
  plat.servicedir "/etc/init.d"
  plat.defaultdir "/etc/sysconfig"
  plat.servicetype "sysv"

  # plat.servicedir "/usr/lib/systemd/system"
  # plat.defaultdir "/etc/sysconfig"
  # plat.servicetype "systemd"
  
  # plat.add_build_repository "http://osmirror.delivery.puppetlabs.net/sles-11-deps-x86_64/sles-11-deps-x86_64.repo"
  # plat.add_build_repository "http://pl-build-tools.delivery.puppetlabs.net/yum/sles/11/x86_64/pl-build-tools-sles-11-x86_64.repo"
  packages = [
    "aaa_base",
    "libbz2-devel",
    "make",
    "pkgconfig",
    "pl-cmake",
    "pl-gcc",
    "readline-devel",
    "rsync",
    "zlib-devel"
  ]
  plat.install_build_dependencies_with "zypper -n --no-gpg-checks install -y"
  plat.provision_with("zypper -n --no-gpg-checks install -y #{packages.join(' ')}")
  plat.vmpooler_template "sles-11-x86_64"
end





# platform "sles-11-x86_64" do |plat|
#   plat.servicedir "/usr/lib/systemd/system"
#   plat.defaultdir "/etc/sysconfig"
#   plat.servicetype "systemd"
#   plat.add_build_repository "http://pl-build-tools.delivery.puppetlabs.net/yum/pl-build-tools-release-#{plat.get_os_name}-#{plat.get_os_version}.noarch.rpm"
#   plat.add_build_repository "http://pl-build-tools.delivery.puppetlabs.net/yum/sles/11/x86_64/pl-build-tools-sles-11-x86_64.repo"
#   plat.add_build_repository "http://osmirror.delivery.puppetlabs.net/sles-11-deps-x86_64/sles-11-deps-x86_64.repo"
#   packages = [
#     "java-1_7_1-ibm-devel",
#     "pkgconfig",
#     "pl-cmake",
#     "pl-gcc",
#     "readline-devel",
#     "rsync",
#     "zlib-devel",
#     "aaa_base",
#     "autoconf",
#     "automake",
#     "rsync",
#     "gcc",
#     "make",
#     "rpm-build",
#     "libbz2-devel"
#   ]
#   plat.provision_with("zypper -n --no-gpg-checks install -y #{packages.join(' ')}")
#   plat.install_build_dependencies_with "zypper -n --no-gpg-checks install -y"
#   plat.install_build_dependencies_with "zypper -n --no-gpg-checks install -y"
#   plat.vmpooler_template "sles-11-x86_64"
# end