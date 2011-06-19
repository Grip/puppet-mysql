define mysql::grants($u = "root",
		$user, 
		$password, 
		$db, 
		$host = "localhost",
		$privileges = "all privileges") {
	
	exec { 
	"grant_$user_$db":
    	path    => "/usr/bin:/usr/sbin:/bin",
    	command => "mysql -u$u -e \"grant $privileges on $db.* to '$user'@'$host' identified by '$password'\"",
    	unless  => "mysql -u$user -D$db -h$host",
    	require => Service['mysql'],
  	}
}
