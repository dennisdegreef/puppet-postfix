
class postfix::params {
    $package_name     = 'postfix'
    $package_manage   = true
    $package_ensure   = installed

    $package_mysql_name   = 'postfix-mysql'
    $package_mysql_manage = true
    $package_mysql_ensure = installed

    $service_name   = 'postfix'
    $service_manage = true
    $service_ensure = running
    $service_enable = true

  $hostname = 'mail0.example.com'

    $config_directory = '/etc/postfix'

  $ssl_cert = '/etc/ssl/certs/ssl-cert-snakeoil.pem'
  $ssl_key  = '/etc/ssl/private/ssl-cert-snakeoil.key'
  $use_tls  = true

  $use_database = false
  $database_engine = 'mysql'

  $database_hostname = '127.0.0.1'
  $database_username = 'mailserver'
  $database_password = 'mailserver'
  $database_dbname   = 'mailserver'
}
