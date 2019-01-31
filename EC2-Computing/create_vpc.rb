require 'aws-sdk-ec2'
ec2 = Aws::EC2::Resource.new(region: 'us-west-2')
vpc = ec2.create_vpc({ cidr_block: '10.200.0.0/16' })
# so we get a Public DNS
vpc.modify_attribute({
    enable_dns_support: { value: true }
})
vpc.modify_attribute({
    enable_dns_hostnames: { value: true }
})
#Name the VPC
vpc.create_tags({ tags: [{ key: 'name' , value:'MYVPC01'}]})
puts vpc.vpc_id
