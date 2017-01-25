# Elastic kibana module for Puppet

[![Build Status](https://travis-ci.org/aquister/puppet-kibana.svg?branch=master)](https://travis-ci.org/aquister/puppet-kibana)


## Description

Puppet module for installing and configuring kibana 5.x


## Usage

Any kibana setting can be configured through the config hash parameter.


```puppet
class { '::kibana':
  manage_repo    => true,
  config         => {
    'elasticsearch.url' => {
      'ensure' => 'present',
      'value'  => 'http://localhost:9200',
    },
    'server.host'       => {
      'ensure' => 'present',
      'value'  => 'localhost',
    },
    'server.port'       => {
      'ensure' => 'present',
      'value'  => '5601',
    },
  },
}
```

## Limitations

See metadata.json for supported platforms

