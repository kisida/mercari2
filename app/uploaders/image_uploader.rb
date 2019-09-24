class ImageUploader < CarrierWave::Uploader::Base

  # 本番環境とローカルで保存先を分ける
  if Rails.env.development? || Rails.env.test?
    storage :file #local
  else
    storage :fog #S3
  end

end