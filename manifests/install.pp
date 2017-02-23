# == Class kibana::install
#
class kibana::install {
  case $::kibana::repo_version {
    '5.x': {
      package { $::kibana::package_name:
        ensure => $::kibana::package_ensure,
      }
    }
    default: {
      unless $::kibana::package_version {
        fail('You need to set kibana::package_version.')
      }

      package { 'curl':
        ensure => present,
      }

      file { $::kibana::package_install_dir:
        ensure => 'directory',
        owner  => 'root',
        group  => 'root',
      }

      exec { 'download_install':
        command => "/usr/bin/curl -L\
                   ${::kibana::package_download_url}/kibana-${::kibana::package_version}-linux-${::kibana::package_arch}.tar.gz\
                   | /bin/tar xvz -C ${::kibana::package_install_dir}",
        require => [ Package['curl'], File[$::kibana::package_install_dir] ],
        timeout => 1800,
        unless  => "/usr/bin/test -d ${::kibana::package_install_dir}/kibana-${::kibana::package_version}-linux-${::kibana::package_arch}",
      }
    }
  }
}
