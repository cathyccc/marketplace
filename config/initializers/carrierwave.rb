CarrierWave.configure do |config|
  config.fog_provider = 'fog'
  config.fog_credentials = {
    provider:              'AWS',
    aws_secret_access_key:  ENV["AWS_SECRET_ACCESS_KEY"]
    # region:                'eu-west-1',                  # optional, defaults to 'us-east-1'
    # host:                  's3.example.com',             # optional, defaults to nil
    # endpoint:              'https://s3.example.com:8080' # optional, defaults to nil
  }
  config.storage = :fog
  config.fog_directory  = ENV["S3_BUCKET"]
end
