if Rails.env.test? or Rails.env.development?
  CarrierWave.configure do |config|
    config.storage = :file
    config.root = "#{Rails.root}/tmp"
    config.cache_dir = "#{Rails.root}/tmp/images"
  end
else
  CarrierWave.configure do |config|                      # required
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider:              'AWS',                        # required
      aws_access_key_id:      ENV["AWS_ACCESS_KEY_ID"],                        # required
      aws_secret_access_key:  ENV["AWS_SECRET_ACCESS_KEY"],                        # required
      # region:                'eu-west-1',                  # optional, defaults to 'us-east-1'
      # host:                  's3.example.com',             # optional, defaults to nil
      # endpoint:              'https://s3.example.com:8080' # optional, defaults to nil
    }
    config.storage = :fog
    config.fog_directory  = ENV["S3_BUCKET"]
  end
end
