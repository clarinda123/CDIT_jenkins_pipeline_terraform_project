locals {
    # Common tags to be assigned to all resources
    common_tags = {
    environment = var.environment
    project      = var.project
    owner       = var.owner
    administrator = var.administrator
  }
}

# vpc
resource "aws_vpc" "jp_vpc" {
  cidr_block       = var.jp_vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = merge(local.common_tags,
    {
      Name = "${var.owner}-vpc-${var.environment}"
    }
  )
}

# internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.jp_vpc.id

  tags = merge(local.common_tags,
    {
      Name = "${var.owner}-igw-${var.environment}"
    }
  )
}


# use data source to get all avalablility zones in region
data "aws_availability_zones" "available_zones" {}

# 2 public subnets
resource "aws_subnet" "pub_sn_1a" {
  vpc_id     = aws_vpc.jp_vpc.id
  cidr_block = var.pub_sn_1a_cidr
  availability_zone = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = "true"

  tags = merge(local.common_tags,
    {
      Name = "${var.owner}-pub_sn_1a-${var.environment}"
    }
  )
}

resource "aws_subnet" "pub_sn_1b" {
  vpc_id     = aws_vpc.jp_vpc.id
  cidr_block = var.pub_sn_1b_cidr
  availability_zone = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch = "true"

  tags = merge(local.common_tags,
    {
      Name = "${var.owner}-pub_sn_1b-${var.environment}"
    }
  )
}

# public route table
resource "aws_route_table" "pub_rt" {
  vpc_id = aws_vpc.jp_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }


  tags = merge(local.common_tags,
    {
      Name = "${var.owner}-pub_rt-${var.environment}"
    }
  )
}

# associate public route table to public subnets
resource "aws_route_table_association" "pub_sn_1a_rt_asso" {
  subnet_id      = aws_subnet.pub_sn_1a.id
  route_table_id = aws_route_table.pub_rt.id
}

resource "aws_route_table_association" "pub_sn_1b_rt_asso" {
  subnet_id      = aws_subnet.pub_sn_1b.id
  route_table_id = aws_route_table.pub_rt.id
}

# 2 private subnets
resource "aws_subnet" "priv_app_sn_1a" {
  vpc_id     = aws_vpc.jp_vpc.id
  cidr_block = var.priv_app_sn_1a_cidr
  availability_zone = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = "false"

  tags = merge(local.common_tags,
    {
      Name = "${var.owner}-priv_app_sn_1a-${var.environment}"
    }
  )
}

resource "aws_subnet" "priv_app_sn_1b" {
  vpc_id     = aws_vpc.jp_vpc.id
  cidr_block = var.priv_app_sn_1b_cidr
  availability_zone = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch = "false"

  tags = merge(local.common_tags,
    {
      Name = "${var.owner}-priv_app_sn_1b-${var.environment}"
    }
  )
}

# 2 private route tables
resource "aws_route_table" "priv_app_rt_1a" {
  vpc_id = aws_vpc.jp_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.ngw_1a.id
  }

  

  tags = merge(local.common_tags,
    {
      Name = "${var.owner}-priv_app_rt_1a-${var.environment}"
    }
  )
}

resource "aws_route_table" "priv_app_rt_1b" {
  vpc_id = aws_vpc.jp_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.ngw_1b.id
  }

  

  tags = merge(local.common_tags,
    {
      Name = "${var.owner}-priv_app_rt_1b-${var.environment}"
    }
  )
}

# associate private app route table 1a
resource "aws_route_table_association" "priv_app_rt_1a_asso" {
  subnet_id      = aws_subnet.priv_app_sn_1a.id
  route_table_id = aws_route_table.priv_app_rt_1a.id
}
# associate private app route table 1a
resource "aws_route_table_association" "priv_app_rt_1b_asso" {
  subnet_id      = aws_subnet.priv_app_sn_1b.id
  route_table_id = aws_route_table.priv_app_rt_1b.id
}

# 2 db subnets
resource "aws_subnet" "priv_db_sn_1a" {
  vpc_id     = aws_vpc.jp_vpc.id
  cidr_block = var.priv_db_sn_1a_cidr
  availability_zone = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = "false"

  tags = merge(local.common_tags,
    {
      Name = "${var.owner}-priv_db_sn_1a-${var.environment}"
    }
  )
}

resource "aws_subnet" "priv_db_sn_1b" {
  vpc_id     = aws_vpc.jp_vpc.id
  cidr_block = var.priv_db_sn_1b_cidr
  availability_zone = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch = "false"

  tags = merge(local.common_tags,
    {
      Name = "${var.owner}-priv_db_sn_1b-${var.environment}"
    }
  )
}



