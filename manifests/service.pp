# == Class kibana::service
#
class kibana::service {
  service { $::kibana::service_name:
    ensure     => $::kibana::service_ensure,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
