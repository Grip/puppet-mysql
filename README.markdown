# mysql puppet module  

## Module: mysql  

This class:

- Installs MySQL server.
- Configure mysql server startup script.
- Import databases from .sql source files
- Create users and grant privileges

### Requires:  
	None  

### Usage example
node 'debian.client.puppet' {
	include mysql

mysql::config_file {
        "/etc/mysql/my.cnf":
        max_connections => "100",
        bind_address => "10.10.0.2",
        key_buffer => "40M",
        query_cache_size => "0",
	innodb_buffer_pool_size => "120M";
        }

mysql::db {
	"test":
	source_file => "test.sql"
	}

mysql::grants {
	"admin_test":
	user => "admin",
	password => "4dm1n",
	db => "test",
	privileges => "all privileges";
	}
}

