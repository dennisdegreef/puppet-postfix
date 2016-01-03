
class postfix::config inherits postfix {

  file { $postfix::config_directory:
    ensure => directory,
    owner  => "root",
    group  => "root",
    mode   => "0644",
  }

  file { "${postfix::config_directory}/main.cf":
    ensure  => file,
    owner   => "root",
    group   => "root",
    mode    => "0644",
    content => template('postfix/main.cf.erb')
  }

  file { "${postfix::config_directory}/master.cf":
    ensure  => file,
    owner   => "root",
    group   => "root",
    mode    => "0644",
    content => template('postfix/master.cf.erb')
  }

  if $use_database {
    $database_config_directory = "${postfix::config_directory}/${postfix::database_engine}"
    file { $database_config_directory:
      ensure => directory,
      owner  => "root",
      group  => "root",
      mode   => "0644",
    }

    file { "${database_config_directory}/alias-maps.cf":
      ensure  => file,
      owner   => "root",
      group   => "root",
      mode    => "0600",
      content => template("postfix/${postfix::database_engine}/alias-maps.cf.erb")
    }

    file { "${database_config_directory}/email2email.cf":
      ensure  => file,
      owner   => "root",
      group   => "root",
      mode    => "0600",
      content => template("postfix/${postfix::database_engine}/email2email.cf.erb")
    }

    file { "${database_config_directory}/mailbox-domains.cf":
      ensure  => file,
      owner   => "root",
      group   => "root",
      mode    => "0600",
      content => template("postfix/${postfix::database_engine}/mailbox-domains.cf.erb")
    }

    file { "${database_config_directory}/mailbox-maps.cf":
      ensure  => file,
      owner   => "root",
      group   => "root",
      mode    => "0600",
      content => template("postfix/${postfix::database_engine}/mailbox-maps.cf.erb")
    }
  }

}
