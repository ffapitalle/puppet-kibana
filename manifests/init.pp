# Class: kibana
#
class kibana (
  String $package_name,
  String $package_ensure,
  String $service_name,
  String $service_ensure,
  Boolean $manage_repo,
  Hash $config,
) {
  contain ::kibana::install
  contain ::kibana::config
  contain ::kibana::service

  if $manage_repo {
    include ::kibana::repo
    Class['::kibana::repo'] -> Class['::kibana::install']
  }

  Class['::kibana::install'] ->
  Class['::kibana::config'] ~>
  Class['::kibana::service']
}
