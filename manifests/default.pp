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
package { 'python-devel':
  ensure => latest
}
->
package { 'python-pip':
  ensure => latest
}
->
exec { '/usr/bin/pip install setuptools --upgrade': }
->
exec { '/usr/bin/python setup.py install':
  cwd  => '/home/vagrant/mopidy'
}
->
exec { '/usr/bin/rpm -qa | /usr/bin/grep -qw gstreamer-python || /usr/bin/yum install -y ftp://rpmfind.net/linux/fedora/linux/releases/20/Everything/x86_64/os/Packages/g/gstreamer-python-0.10.22-5.fc20.x86_64.rpm': }
->
exec { '/usr/bin/wget https://developer.spotify.com/download/libspotify/libspotify-12.1.51-Linux-x86_64-release.tar.gz':
  cwd => '/home/vagrant'
}
->
exec { '/usr/bin/tar zxfv libspotify-12.1.51-Linux-x86_64-release.tar.gz':
  cwd => '/home/vagrant'
}
->
exec { '/usr/bin/make install prefix==/usr/local':
  cwd => '/home/vagrant/libspotify-12.1.51-Linux-x86_64-release'
}
->
file { '/etc/ld.so.conf.d/libspotify.conf':
  ensure  => present,
  content => "/usr/local/lib"
}
->
exec { '/usr/sbin/ldconfig': }
#->
#python::pip { 'mopidy-spotify': 
#  ensure => latest
#}
#->
#python::pip { 'mopidy-scrobbler':
#  ensure => latest
#}
