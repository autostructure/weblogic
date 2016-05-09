# Installs oracle jdk
class weblogic::java {
  # Remove open jdk java
  $remove = [ 'java-1.7.0-openjdk.x86_64', 'java-1.6.0-openjdk.x86_64' ]

  package { $remove:
    ensure  => absent,
  }

  # Ensure unzip is available
  package { 'unzip':
    ensure => present,
  }

  ::java::oracle { 'jdk6':
    ensure  => 'present',
    version => '6',
    java_se => 'jdk',
  }
}
