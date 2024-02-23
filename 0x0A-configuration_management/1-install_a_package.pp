#!/usr/bin/puppet

# Ensure that apt-get update is executed before attempting to install packages
exec { 'apt-get update':
  command => '/usr/bin/apt-get update',
}

# Install a specific version of Flask (2.1.0) using pip3
package { 'flask':
  ensure   => '2.1.0',
  provider => 'pip3',
  require  => Exec['apt-get update'], # Ensure that apt-get update is executed before installing Flask
}
