class lamp::wordpress inherits lamp {

file { '/tmp/latest.tar.gz':
        ensure => present,
        source => "puppet:///modules/lamp/latest.tar.gz"
    }


exec { 'extract':
        cwd => "/tmp",
        command => "tar -xvzf latest.tar.gz",
        require => File['/tmp/latest.tar.gz'],
    }

exec { 'copy':
        command => "cp -arp /tmp/wordpress/* /var/www/",
        require => Exec['extract'],
        owner   => 'apache2',
        group   => 'apache2',
	require => Exec['extract'],
    }

file { '/var/www/wp-config.php':
        ensure => present,
	content => template("lamp/wp-config.php.erb")
    }
}

