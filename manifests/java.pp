# Installs oracle jdk
class weblogic::java {
  # Remove open jdk java
  $remove = [ 'java-1.7.0-openjdk.x86_64', 'java-1.6.0-openjdk.x86_64' ]

  package { $remove:
    ensure  => absent,
  }

  # Figure our parameters from java install filename
  if $::weblogic::java_install_filename =~ /^jdk-(\d)u(\d\d)/ {
    $jdk_version_major = $1
    $jdk_version_minor = $2
  }

  # include biedmond jdk7
  include ::jdk7

  ::jdk7::install7 { "jdk1.${jdk_version_major}.0_${jdk_version_minor}":
    version                   => "${jdk_version_major}u${jdk_version_minor}" ,
    fullVersion               => "jdk1.${jdk_version_major}.0_${jdk_version_minor}",
    alternativesPriority      => 18000,
    x64                       => true,
    downloadDir               => $weblogic::download_dir,
    urandomJavaFix            => true,
    rsakeySizeFix             => true,
    cryptographyExtensionFile => 'UnlimitedJCEPolicyJDK7.zip',
    sourcePath                => $weblogic::source,
  }
}
