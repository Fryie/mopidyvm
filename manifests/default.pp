package { 'openssl-devel':
  ensure => latest
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
  pip => true,
  dev => true
}
->
exec { '/usr/bin/python setup.py develop':
  cwd => '/home/vagrant/mopidy'
}
->
exec { '/usr/bin/yum install -y ftp://rpmfind.net/linux/fedora/linux/releases/20/Everything/x86_64/os/Packages/g/gstreamer-python-0.10.22-5.fc20.x86_64.rpm': }
