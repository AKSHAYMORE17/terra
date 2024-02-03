resource "aws_vpc" "myvpc" {
    cidr_block = var.vpc_cidr_block
    tags = {
        Name = "myvpc"
    }
}
data "aws_availability_zones" "available" {
    state = "available"
  
}
resource "aws_subnet" "public-sn1" {
    vpc_id                  = aws_vpc.myvpc.id
    cidr_block              = var.public_subnet1_cidr_block
    availability_zone       = data.aws_availability_zones.available.names[0]
    map_public_ip_on_launch = true
    tags                     = {Name= "public-sn1"}
}
resource "aws_subnet" "public-sn2" {
    vpc_id                  = aws_vpc.myvpc.id
    cidr_block              = var.public_subnet2_cidr_block
    availability_zone       = data.aws_availability_zones.available.names[1]
    map_public_ip_on_launch = true
    tags                     = {Name= "public-sn2"}
}

resource "aws_subnet" "private-sn1" {
    vpc_id                  = aws_vpc.myvpc.id
    cidr_block              = var.private_subnet1_cidr_block
    availability_zone       = data.aws_availability_zones.available.names[0]
    # map_public_ip_on_launch = true
    tags                     = {Name= "private-sn1"}
}
resource "aws_subnet" "private-sn2" {
    vpc_id                  = aws_vpc.myvpc.id
    cidr_block              = var.private_subnet2_cidr_block
    availability_zone       = data.aws_availability_zones.available.names[1]
    # map_public_ip_on_launch = true
    tags                     = {Name= "private-sn2"}
}

resource "aws_subnet" "private-sn3" {
    vpc_id                  = aws_vpc.myvpc.id
    cidr_block              = var.private_subnet3_cidr_block
    availability_zone       = data.aws_availability_zones.available.names[2]
    # map_public_ip_on_launch = true
    tags                     = {Name= "private-sn3"}
}

resource "aws_subnet" "private-sn4" {
    vpc_id                  = aws_vpc.myvpc.id
    cidr_block              = var.private_subnet4_cidr_block
    availability_zone       = data.aws_availability_zones.available.names[3]
    # map_public_ip_on_launch = true
    tags                     = {Name= "private-sn4"}
}
resource "aws_subnet" "private-sn5" {
    vpc_id                  = aws_vpc.myvpc.id
    cidr_block              = var.private_subnet5_cidr_block
    availability_zone       = data.aws_availability_zones.available.names[4]
    # map_public_ip_on_launch = true
    tags                     = {Name= "private-sn5"}
}
resource "aws_subnet" "private-sn6" {
    vpc_id                  = aws_vpc.myvpc.id
    cidr_block              = var.private_subnet6_cidr_block
    availability_zone       = data.aws_availability_zones.available.names[5]
    # map_public_ip_on_launch = true
    tags                     = {Name= "private-sn6"}
}

resource "aws_internet_gateway" "my_ig" {
    vpc_id = aws_vpc.myvpc.id
    tags = {
        Name = "myIG"
        }
}


resource "aws_route_table" "public_route_table" {
    vpc_id = aws_vpc.myvpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my_ig.id
        }
        tags = {
            Name = "PublicRouteTable"
        }
}

# resource "aws_eip" "nat_gateway_eip" {
#     vpc = true
#     tags = {
#         Name = "NATGatewayEIP"
#     }
# }

# resource "aws_nat_gateway" "nat_gateway" {
#     allocation_id = aws_eip.nat_gateway_eip.id
#     subnet_id     = aws_subnet.public-sn1.id
#     tags = {
#         Name = "NATGateway"
#     }
# }
resource "aws_route_table" "private_route_table" {
    vpc_id = aws_vpc.myvpc.id
    # route {
    #     cidr_block = "0.0.0.0/0"
    #     nat_gateway_id = aws_nat_gateway.nat_gateway.id
    #     }
        tags = {
            Name = "PrivateRouteTable"
            }
}

resource "aws_route_table_association" "public_route_association_1" {
    route_table_id = aws_route_table.public_route_table.id
    subnet_id = aws_subnet.public-sn1.id
}
resource "aws_route_table_association" "public_route_association_2" {
    route_table_id = aws_route_table.public_route_table.id
    subnet_id = aws_subnet.public-sn2.id
}

resource "aws_route_table_association" "private_route_association_1" {
    route_table_id = aws_route_table.private_route_table.id
    subnet_id = aws_subnet.private-sn1.id
}
resource "aws_route_table_association" "private_route_association_2" {
    route_table_id = aws_route_table.private_route_table.id
    subnet_id = aws_subnet.private-sn2.id
}
resource "aws_route_table_association" "private_route_association_3" {
    route_table_id = aws_route_table.private_route_table.id
    subnet_id = aws_subnet.private-sn3.id
}
resource "aws_route_table_association" "private_route_association_4" {
    route_table_id = aws_route_table.private_route_table.id
    subnet_id = aws_subnet.private-sn4.id
}
resource "aws_route_table_association" "private_route_association_5" {
    route_table_id = aws_route_table.private_route_table.id
    subnet_id = aws_subnet.private-sn5.id
}
resource "aws_route_table_association" "private_route_association_6" {
    route_table_id = aws_route_table.private_route_table.id
    subnet_id = aws_subnet.private-sn6.id
}