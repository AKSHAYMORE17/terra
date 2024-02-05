# Terraform-Modules
# must copy internal_LB DNS and paste in web-server nginx configration file and proxy_pass to Internal_Load_Balancer (App-server) --- imp

# Create Resources in VPC AWS
## 1) 1 Vpc
## 2) 2 public-subnets & 46 private-subnets
## 3) 2 route-table - public rt & private rt
## 4) 1 Internet-gatway and attach to public-rt
## 5) 1 Nat-gatway and attach to private-rt

# Create Resources in EC2 AWS
## 1) 1 Internet-facing Load-Balancer (application) ( facing internet )
## 2) 1 Internal-facing Load-Balancer (application) ( not facing internet )
## 3) 2 target group ( internal-load-balancer-tg && internet-load-balancer-tg)
## 4) 5 Surity-groups ( Internet-LB,Internal-LB,Template-Web-Server,Template-App-Server,RDS-Instance-sg)
## 5) 1 Template-Web-Server (for Auto Scaling Group - Web)
## 6) 1 Template-App-Server (for Auto Scaling Group - App)
## 7) 1 Target-Group-Web-Server (for Auto Scaling Group - Web)
## 6) 1 Target-Group-App-Server (for Auto Scaling Group - App)
