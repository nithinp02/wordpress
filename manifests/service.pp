class lamp::service inherits lamp {


service {"ntp":
ensure => running,
}

service {"apache2":
ensure => running,
}

service {"mysq;":
ensure => running,
}

}
