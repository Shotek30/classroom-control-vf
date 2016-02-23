class memcached {

  package { 'memcached':
   ensure => present,
  }

  file { '/etc/sysconfig/memcached':
    ensure => file,
    require => Package['memcached'],
    source => 'puppet:///modules/memcached/memcached',
  }
  
  service { 'memcached':
    ensure => running,
    ensure => true,
    subscribe => File['/etc/sysconfig/memcached'],
  }
}
