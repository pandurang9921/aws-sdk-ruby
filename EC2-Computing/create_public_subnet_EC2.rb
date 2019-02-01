require 'aws-sdk-ec2'
 ec2 = Aws::EC2::Resource.new(region: 'us-west-2')
 subnet = ec2.create_subnet({
     vpc_id: 'vpc-0f793200ff61fdf53' ,
     cidr_block: '10.200.0.0/16' ,
     availability_zone: 'us-west-2a'
 })
 subnet.create_tags({ tags: [{ key: 'name' , value: 'myvpc53'}]})
 puts subnet.id