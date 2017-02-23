# == Class kibana::params
#
class kibana::params {
  $package_name         = 'kibana'
  $package_ensure       = 'present'
  $package_version      = undef
  $package_arch         = 'x64'
  $package_install_dir  = '/opt/kibana'
  $package_download_url = 'https://download.elasticsearch.org/kibana/kibana'
  $service_name         = 'kibana'
  $service_ensure       = 'running'
  $manage_repo          = true
  $repo_version         = '5.x'
  $config               = {}
}
