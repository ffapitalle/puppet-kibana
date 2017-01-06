# == Class kibana::install
#
class kibana::install {
  package { $::kibana::package_name:
    ensure => $::kibana::package_ensure,
  }
}
