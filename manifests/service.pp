# == Class weblogic::service
#
# This class is meant to be called from weblogic.
# It ensure the service is running.
#
class weblogic::service {

  service { $::weblogic::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
