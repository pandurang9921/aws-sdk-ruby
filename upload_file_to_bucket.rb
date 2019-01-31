require 'aws-sdk-s3'
profile_name = "pandurang"
region = "us-east-1"
bucket = 'divanshu4102017' # file will be loaded ti this bucket
s3 = Aws::S3::Client.new(profile: profile_name, region: region) #configure s3
s3.put_object(bucket: bucket, key: "file1", body: "My first s3 object") #call put_object method
# Check the file exists
resp = s3.list_objects_v2(bucket: bucket)
resp.contents.each do |obj|
  puts obj.key
end

