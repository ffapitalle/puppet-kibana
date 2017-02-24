# == Class kibana::service
#
class kibana::service {

  if $::kibana::repo_version != '5.x' {
    file { 'kibana-init-script':
      ensure  => file,
      path    => '/etc/init/kibana.conf',
      content => template('kibana/kibana.upstart.erb'),
      notify  => Service[$::kibana::service_name],
    }

    if versioncmp($::lsbdistrelease,'15') >= 0 {
      file { 'kibana-systemd-service':
        ensure  => file,
        path    => '/etc/systemd/system/kibana.service',
        content => template('kibana/kibana.systemd.erb'),
        notify  => Service[$::kibana::service_name],
      }
    } else {
      file { 'kibana-init-script':
        ensure  => file,
        path    => '/etc/init/kibana.conf',
        content => template('kibana/kibana.upstart.erb'),
        notify  => Service[$::kibana::service_name],
      }
  }

  service { $::kibana::service_name:
    ensure     => $::kibana::service_ensure,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
