class xmpp (
  $conf_file        = '/etc/puppet/xmpp.yaml',
  $conf_template    = 'xmpp/xmpp.yaml.erb',
  $package_name     = 'xmmp4r',
  $package_ensure   = present,
  $package_provider = 'gem',
  $xmpp_jid         = undef,
  $xmpp_password    = undef,
  $xmpp_target      = undef,
  $xmpp_muc         = undef,
  $xmpp_environment = 'ALL',
  $xmpp_server      = undef
) {
  
  file { $conf_file:
    content => template($conf_template)
  }
  package { $package_name:
    ensure   => $package_ensure,
    provider => $package_provider
  }
  
  Package[$package_name] -> File[$conf_file]
}