#vpc id
output "jp_vpc_dev_id" {
    value = module.networking.jp_vpc_id
}
# internet_gateway_dev_id
output "igw_id" {
    value = module.networking.igw_id
  
}
# pub_subnet_1a_dev_id
output "pub_sn_1a_id" {
    value = module.networking.pub_sn_1a_id
}
# pub_subnet_1b_dev_id
output "pub_sn_1b_id" {
    value = module.networking.pub_sn_1b_id
}
# priv_app_subnet_1a_dev_id
output "priv_app_sn_1a_id" {
    value = module.networking.priv_app_sn_1a_id
}
# priv_app_subnet_1b_dev_id
output "priv_app_sn_1b_id" {
    value = module.networking.priv_app_sn_1b_id
}
# priv_db_subnet_1a_dev_id
output "priv_db_sn_1a_id" {
    value = module.networking.priv_db_sn_1a_id
}
# priv_db_subnet_1b_dev_id
output "priv_db_sn_1b_id" {
    value = module.networking.priv_db_sn_1b_id
}
# public_route_table_dev_id
output "pub_rt_id" {
    value = module.networking.pub_rt_id
}
# private_route_table_1a_dev_id
output "priv_app_rt_1a_id" {
    value = module.networking.priv_app_rt_1a_id
}
# private_route_table_1b_dev_id
output "priv_app_rt_1b_id" {
    value = module.networking.priv_app_rt_1b_id
}
# nat_gateway_1a_dev_id
output "ngw_1a_id" {
    value = module.networking.ngw_1a_id
}
# nat_gateway_1b_dev_id
output "ngw_1b_id" {
    value = module.networking.ngw_1b_id
}
