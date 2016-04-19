# Class: weblogic
# ===========================
#
# Full description of class weblogic here.
#
# Parameters
# ----------
#
# * `sample parameter`
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
class weblogic (
  $package_name = $::weblogic::params::package_name,
  $service_name = $::weblogic::params::service_name,
) inherits ::weblogic::params {

  # validate parameters here

  class { '::weblogic::install': } ->
  class { '::weblogic::config': } ~>
  class { '::weblogic::service': } ->
  Class['::weblogic']
}
