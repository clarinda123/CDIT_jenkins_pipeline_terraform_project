#vpc id
output "jp_vpc_dev_id" {
    value = module.networking.jp_vpc_id
}
# internet gateway id
output "igw_dev_id" {
    value = module.networking.igw_id
  
}
# public subnet 1a id
output "pub_sn_1a_dev_id" {
    value = module.networking.pub_sn_1a_id
}
# public subnet 1b id
output "pub_sn_1b_dev_id" {
    value = module.networking.pub_sn_1b_id
}
# private app subnet 1a id
output "priv_app_sn_1a_dev_id" {
    value = module.networking.priv_app_sn_1a_id
}
# private app subnet 1b id
output "priv_app_sn_1b_dev_id" {
    value = module.networking.priv_app_sn_1b_id
}
# private db subnet 1a id
output "priv_db_sn_1a_dev_id" {
    value = module.networking.priv_db_sn_1a_id
}
# private db subnet 1b id
output "priv_db_sn_1b_dev_id" {
    value = module.networking.priv_db_sn_1b_id
}
# public route table id
output "pub_rt_dev_id" {
    value = module.networking.pub_rt_id
}
# private route table 1a id
output "priv_app_rt_1a_dev_id" {
    value = module.networking.priv_app_rt_1a_id
}
# private route table 1b dev id
output "priv_app_rt_1b_dev_id" {
    value = module.networking.priv_app_rt_1b_id
}
# nat gateway 1a id
output "ngw_1a_dev_id" {
    value = module.networking.ngw_1a_id
}
# nat gateway 1b id
output "ngw_1b_dev_id" {
    value = module.networking.ngw_1b_id
}
