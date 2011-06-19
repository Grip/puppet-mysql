define mysql::config_file($owner = "root", 
			$group = "root", 
			$mode = "644",
			$max_connections = "500",
			$max_allowed_packet = "16M",
			$bind_address = "127.0.0.1",
			$port = "3306",
			$key_buffer = "16M",
			$query_cache_size = "120M",
			$long_query_time = "5",
			$innodb_buffer_pool_size = "1G",
			$thread_cache_size = "128") {

file { $name:
	mode => $mode,
	owner => $owner,
	group => $group,
	content => template("mysql/my.erb");
	}
} 
