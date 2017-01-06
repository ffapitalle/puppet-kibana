# == Class kibana::config
#
class kibana::config {

  $settings = { '' => $::kibana::config }

  $defaults = {
    path              => '/etc/kibana/kibana.yml',
    key_val_separator => ':',
  }

  create_ini_settings($settings, $defaults)
}
