class motd {
package { ruby:
	ensure => installed,
	}

file 	{ "/etc/motd" :
    	mode    => 444,
   	content => template("motd/motd.erb"),
	}
}
