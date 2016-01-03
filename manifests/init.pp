
class postfix (

  $package_name     = $postfix::params::package_name,
  $package_manage   = $postfix::params::package_manage,
  $package_ensure   = $postfix::params::package_ensure,

  $package_mysql_name   = $postfix::params::package_mysql_name,
  $package_mysql_manage = $postfix::params::package_mysql_manage,
  $package_mysql_ensure = $postfix::params::package_mysql_ensure,

  $service_name   = $postfix::params::service_name,
  $service_manage = $postfix::params::service_manage,
  $service_ensure = $postfix::params::service_ensure,
  $service_enable = $postfix::params::service_enable,

  $hostname = $postfix::params::hostname,

  $config_directory = $postfix::params::config_directory,

  $ssl_cert = $postfix::params::ssl_cert,
  $ssl_key  = $postfix::params::ssl_key,
  $use_tls  = $postfix::params::use_tls,

  $use_database = $postfix::params::use_database,
  $database_engine = $postfix::params::database_engine,
  $database_hostname = $postfix::params::database_hostname,
  $database_username = $postfix::params::database_username,
  $database_password = $postfix::params::database_password,
  $database_dbname   = $postfix::params::database_dbname,

) inherits postfix::params {

  $real_use_tls = $use_tls ? {
    true  => 'yes',
    false => 'no',
  }

  if $use_database {
    case $database_engine {
      'mysql': {

      }
      default: {
        fail("Database engine ${database_engine} not implemented")
      }
    }
  }

  # http://docs.puppetlabs.com/puppet/2.7/reference/lang_containment.html#known-issues
  anchor { 'postfix::begin': } ->
  class { '::postfix::install': } ->
  class { '::postfix::config': } ~>
  class { '::postfix::service': } ->
  anchor { 'postfix::end': }

}
