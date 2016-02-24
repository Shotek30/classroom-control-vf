define users::managed_user {
  $home_base = "/home",
  $group = $title,
){
  File {
    owner => $title,
    gid => $group,
    mode => '0640',
  }
  
  group { $title:
    ensure => present,
  }
  
  user {$title:
    ensure => present,
    gid => $group,
  }
  
  file { "$home_base/$title":
    ensure => directory,
  }

  file { "home_base/$title/.ssh":
    ensure => directory,
    mode => '0700',
  }
  
}
