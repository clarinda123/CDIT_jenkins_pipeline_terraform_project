module "networking" {
    source = "../../modules/networking"
    # provider
    region = var.region
    profile = var.profile
    # locals
    environment = var.environment
    project = var.project
    owner = var.owner
    administrator = var.administrator
    # vpc cidr
    jp_vpc_cidr = var.jp_vpc_cidr
    # public subnet cidrs
    pub_sn_1a_cidr = var.pub_sn_1a_cidr
    pub_sn_1b_cidr = var.pub_sn_1b_cidr
    # privat app subnet cidrs
    priv_app_sn_1a_cidr = var.priv_app_sn_1a_cidr
    priv_app_sn_1b_cidr = var.priv_app_sn_1b_cidr
    # privat db subnet cidrs
    priv_db_sn_1a_cidr = var.priv_db_sn_1a_cidr
    priv_db_sn_1b_cidr = var.priv_db_sn_1b_cidr
}