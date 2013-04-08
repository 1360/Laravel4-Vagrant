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
}
