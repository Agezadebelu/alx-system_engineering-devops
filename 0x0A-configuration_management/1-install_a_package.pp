# Define the exec resource to update package lists
exec { 'apt_update':
  command => '/usr/bin/apt-get update',
  path    => ['/bin', '/usr/bin/'],
}

# Install Flask version 2.1.0 using pip3
package { 'Flask':
  ensure   => '2.1.0',
  provider => 'pip3',
  require  => Exec['apt_update'], # Ensure apt-get update is executed before installing Flask
}
