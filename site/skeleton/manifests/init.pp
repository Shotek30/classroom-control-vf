class skeleton {

  file { '/etc/skel':
    ensure => directory,
  }
  
  file { '/etc/skel/.bashrc':
    ensure => file,
    source => "pupper:///modules/skeleton/bashrc",
  }
}
