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

	exec { 'install sims project':
		cwd => "/var/www/",
		command => "cd sims/ && composer install",
		onlyif => "git clone git@github.com:editure/sims.git",
		require => [Exec['global composer'], Package['git-core']],
		creates => "/var/www/sims/vendor/",
		timeout => 900,
	}

	exec { 'update sims project':
		cwd => "/var/www/sims/",
		command => "composer update",
		onlyif => [
			"ls -al | grep -c vendor",
			"git clone git@github.com:editure/sims.git"
			],
		require => [Exec['global composer'], Package['git-core']],
		timeout => 900,
	}

	file { '/var/www/app/storage':
		mode => 0777
	}
}
