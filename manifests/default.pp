package { 'git':
  ensure => installed
}
->
vcsrepo { '/vagrant/mopidy':
  ensure   => latest,
  provider => git,
  source   => "git://github.com/Fryie/mopidy"
}
->
class { 'python':
  pip => true
}

