# == Class weblogic::install
#
# This class is called from weblogic for install.
#
class weblogic::install {

  package { $::weblogic::package_name:
    ensure => present,
  }
}
