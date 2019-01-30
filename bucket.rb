require 'aws-sdk-s3'  # v2: require 'aws-sdk'
require 'json'

profile_name = 'pandurang'
region = "us-east-1"
bucket = 'doc-sample-ruby'
my_bucket = 'cloud12'

# S3

# Configure SDK
s3 = Aws::S3::Client.new(profile: profile_name, region: region)
s3.create_bucket(bucket: bucket)
resp = s3.list_buckets
resp.buckets.each do |bucket|
  puts bucket.name
end

