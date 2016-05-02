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

  # Figure our parameters from java install filename
  #iif $::weblogic::java_install_filename =~ /^jdk-(\d)u(\d\d)/ {
  #  $jdk_version_major = $1
  #  $jdk_version_minor = $2
  #}

  # JDK HOME

  #$full_version = "jdk1.${jdk_version_major}.0_${jdk_version_minor}"
  #$jdk_home_dir = "/usr/java/${full_version}"

  # include biedmond jdk7
  #include ::jdk7

  #  ::jdk7::install7 { "jdk1.${jdk_version_major}.0_${jdk_version_minor}":
  #  version                     => "${jdk_version_major}u${jdk_version_minor}" ,
  #  full_version                => $full_version,
  #  alternatives_priority       => 18000,
  #  x64                         => true,
  #  download_dir                => $::weblogic::download_dir,
  #  urandom_java_fix            => true,
  #  rsa_key_size_fix            => true,
  #  cryptography_extension_file => 'jce_policy-8.zip',
  #  source_path                 => $::weblogic::source,
  #  require                     => Package['unzip'],
  #  before                      => Class['::orawls::weblogic'],
  #}


  file {'/vagrant/oracle_software/jdk-6u24-linux-x64.bin':
    ensure => file,
    mode   => 'a+x',
  }

  exec {'/vagrant/oracle_software/jdk-6u24-linux-x64.bin':
    creates => '/usr/java',
  }
}
