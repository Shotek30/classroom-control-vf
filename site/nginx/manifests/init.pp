class nginx {
  
  File {
    owner => 'root',
    group => 'root',
    mode => '0644',
  }
  
  package {'nginx':
    ensure => present,
    before => [File['config'], File['block']], 
  }
  
  file {'docroot':
    ensure => directory,
    path => '/var/www',
  }
  
  file { 'index':
    ensure => file,
    path => '/var/www/index.html',
    source => 'puppet:///modules/nginx/index.html',
  }

  file { 'config':
    ensure => file,
    path => '/etc/nginx/nginx.conf',
    source => 'puppet:///modules/nginx/nginx.conf',
    require => Package['nginx'],
    notify => Service['nginx'],
  }
  
  file { 'block':
    ensure => file,
    path => '/etc/nginx/conf.d/default.conf',
    source => 'puppet:///modules/nginx/default.conf',
    require => Package['nginx'],
    notify => Service['nginx'],
  }
  
  service { 'nginx':
    ensure => running,
    require => [File['docroot'], File['index']],
    subscribe => [File['config'], File['block']],
  }  

}