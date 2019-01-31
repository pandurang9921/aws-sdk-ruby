require 'aws-sdk-s3'
require "json"
profile_name = "pandurang"
region = 'us-east-2'
bucket = 'divanshu4102017'
s3 = Aws::S3::Client.new(profile: profile_name, region: region)
s3.delete_objects(
  bucket: bucket,
  delete: {
    objects: [
      {
        key: 'file1'
      }
    ]
  }
)

# Verify objects now have been deleted
resp = s3.list_objects_v2(bucket: bucket)
resp.contents.each do |obj|
  puts obj.key
end
