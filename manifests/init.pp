class lamp {
    include lamp::install
    include lamp::wordpress
    include lamp::db
    include lamp::service
}
