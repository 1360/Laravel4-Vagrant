class other 
{
    package 
    { 
        "curl":
            ensure  => present,
            require => Exec['apt-get update']
    }

    package
    {
    	"vim":
    		ensure => present,
    		require => Exec['apt-get update']

    }

    exec{
    	"phpunit install":
    		command => 'pear config-set auto_discover 1 && pear install pear.phpunit.de/PHPUnit',
    		require => Package['php-pear']
    }

    file{
        "/root/.ssh/":
            ensure  => directory,
            recurse => true,
            owner => root, 
            group => root,
            source  => "/vagrant/puppet/templates/.ssh/",
            require => Package['git-core'],
            mode => 0700       
    }

    file { '/root/.ssh/is_rsa-github.com':
        ensure => present,
        owner => root, group => root,
        mode => 0500
    }

}
