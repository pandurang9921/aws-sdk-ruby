require 'aws-sdk-ec2'  # v2: require 'aws-sdk'
require 'base64'

# User code that's executed when the instance starts
#script = ''

#encoded_script = Base64.encode64(script)

ec2 = Aws::EC2::Resource.new(region: 'us-west-2')

instance = ec2.create_instances({
  image_id: 'ami-f12f71c1',
  min_count: 1,
  max_count: 1,
 # key_name: 'MyGroovyKeyPair',
  security_group_ids: ['sg-76772a00'],
  #user_data: encoded_script,
  instance_type: 't2.micro',
  placement: {
    availability_zone: 'us-west-2c'
  },
  subnet_id: 'subnet-ca7f4590',
 # iam_instance_profile: {
  #  arn: 'arn:aws:iam::' + 'pandurang' + ':instance-profile/aws-opsworks-ec2-role'
  #}
})

# Wait for the instance to be created, running, and passed status checks
ec2.client.wait_until(:instance_status_ok, {instance_ids: [instance.first.id]})

# Name the instance 'MyGroovyInstance' and give it the Group tag 'MyGroovyGroup'
instance.create_tags({ tags: [{ key: 'Name', value: 'MyGroovyInstance' }, { key: 'Group', value: 'MyGroovyGroup' }]})

puts instance.id
puts instance.public_ip_address
