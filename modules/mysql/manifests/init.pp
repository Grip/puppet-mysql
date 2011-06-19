class mysql {
$mysql = $operatingsystem ? {
	"debian" => "mysql-server",
	"centos" => "mysql",
	default => "mysql",
	}

package { $mysql:
	ensure => installed,
	}

service { mysql:
	ensure => running,
	hasrestart => true,
    	hasstatus  => true,
	enable => true,
	require => Package[$mysql],
	}
}
