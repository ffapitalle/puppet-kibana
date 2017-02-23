# == Class: kibana
#
class kibana (
  $package_name         = $kibana::params::package_name,
  $package_ensure       = $kibana::params::package_ensure,
  $package_version      = $kibana::params::package_version,
  $package_arch         = $kibana::params::package_arch,
  $package_install_dir  = $kibana::params::package_install_dir,
  $package_download_url = $kibana::params::package_download_url,
  $service_name         = $kibana::params::service_name,
  $service_ensure       = $kibana::params::service_ensure,
  $manage_repo          = $kibana::params::manage_repo,
  $repo_version         = $kibana::params::repo_version,
  $config               = $kibana::params::config,
) inherits ::kibana::params {
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
