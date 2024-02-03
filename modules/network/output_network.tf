output "vpc_id" {
    value = aws_vpc.myvpc.id
}
output "public_sub1_id" {
    value = aws_subnet.public-sn1.id
}
output "public_sub2_id" {
    value = aws_subnet.public-sn2.id
}
output "private_sub1_id" {
    value = aws_subnet.private-sn1.id
  
}
output "private_sub2_id" {
    value = aws_subnet.private-sn2.id
}
output "private_sub3_id" {
    value = aws_subnet.private-sn3.id
}
output "private_sub4_id" {
    value = aws_subnet.private-sn4.id 
}

output "private_sub5_id" {
    value = aws_subnet.private-sn5.id 
}
output "private_sub6_id" {
    value = aws_subnet.private-sn6.id
}
