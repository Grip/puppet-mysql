class mysqlserver inherits defaultserver {
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
        require => Package[$mysql],
        }
}
