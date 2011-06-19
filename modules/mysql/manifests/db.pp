define mysql::db($u = "root",
	$source_file) {
  
  file { "/tmp/$source_file":
	source => "puppet:///db_schemas/$source_file"
	}
	

  exec	{ "schema_load_$name":
    	path    => "/usr/bin:/usr/sbin:/bin",
    	command => "mysql -u$u < /tmp/$source_file",
    	unless  => "mysql -u$u -e \"use $name\"",
    	require => Service['mysql']
  	}   
}
