package { 'openssl-devel':
  ensure => installed
}
->
package { 'git':
  ensure => installed
}
->
vcsrepo { '/home/vagrant/mopidy':
  ensure   => latest,
  provider => git,
  source   => "git://github.com/Fryie/mopidy",
  user     => 'vagrant'
}
->
class { 'python':
  pip        => true,
  dev        => true,
  virtualenv => true
}
->
python::virtualenv { '/home/vagrant/env':
  ensure     => present,
  owner      => 'vagrant',
  systempkgs => true,
  timeout    => 0
}
->
exec { '/home/vagrant/env/bin/python setup.py develop':
  cwd         => '/home/vagrant/mopidy',
  environment => "VIRTUAL_ENV=/home/vagrant/env",
  user        => 'vagrant'
}
