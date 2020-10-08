require 'refile/s3'

if Rails.env.production? 
  aws = {
    access_key_id: ENV['AWS_ACCESS_KEY_ID'], # アクセスキーID
    secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'], # シークレットアクセスキー
    region: 'ap-northeast-1',
    bucket: 'cinema-review-s3',
  }
  Refile.cache = Refile::S3.new(prefix: 'cache', **aws)
  Refile.store = Refile::S3.new(prefix: 'store', **aws)
end