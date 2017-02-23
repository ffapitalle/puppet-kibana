# == Class kibana::repo
#
class kibana::repo {
  case $::osfamily {
    'Debian': {
      include ::apt
      apt::source { "elastic-${::kibana::repo_version}":
        location => "https://artifacts.elastic.co/packages/${::kibana::repo_version}/apt",
        release  => '',
        repos    => 'stable main',
        include  => {
          'deb' => true,
        },
        key      => {
          id     => '46095ACC8548582C1A2699A9D27D666CD88E42B4',
          source => 'https://artifacts.elastic.co/GPG-KEY-elasticsearch',
        },
      }
      if !defined(Package['apt-transport-https']) {
        package { 'apt-transport-https':
          ensure => present,
        }
      }
    }
    'RedHat': {
      yumrepo { "elastic-${::kibana::repo_version}":
        baseurl        => "https://artifacts.elastic.co/packages/${::kibana::repo_version}/yum",
        enabled        => '1',
        gpgcheck       => '1',
        gpgkey         => 'https://artifacts.elastic.co/GPG-KEY-elasticsearch',
        failovermethod => 'priority',
      }
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
