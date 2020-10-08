require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.storage :fog
  config.fog_provider = 'fog/aws'
  config.fog_directory  = 'cinema-review-s3'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AKIA6G6D3GRBEHX6X4XN'],
    aws_secret_access_key: ENV['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'],
    region: ENV['ap-northeast-1'],
    path_style: true
  }

end