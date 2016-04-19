# == Class weblogic::params
#
# This class is meant to be called from weblogic.
# It sets variables according to platform.
#
class weblogic::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'weblogic'
      $service_name = 'weblogic'
    }
    'RedHat', 'Amazon': {
      $package_name = 'weblogic'
      $service_name = 'weblogic'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
