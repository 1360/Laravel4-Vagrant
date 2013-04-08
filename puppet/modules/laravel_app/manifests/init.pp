class laravel_app 
{

	package { 'git-core':
    	ensure => present,
    }

   	exec { 'install composer':
	    command => 'curl -s https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin',
	    require => Package['php5-cli'],
	}

	exec { 'global composer':
		command => "sudo mv /usr/local/bin/composer.phar /usr/local/bin/composer",
		require => Exec['install composer'],
	}

	exec { 'get laravel packages':
		command => "/bin/sh -c 'cd /var/www/sims/ && composer install'",
		require => [Exec['global composer'], Package['git-core']],
		timeout => 900,
	}

	file { '/var/www/app/storage':
		mode => 0777
	}
}
