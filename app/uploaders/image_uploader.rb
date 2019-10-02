class ImageUploader < CarrierWave::Uploader::Base

  #carrierwave内でminimagickを使用する
  include CarrierWave::MiniMagick
  
  
  # 本番環境とローカルで保存先を分ける
  if Rails.env.development? || Rails.env.test?
    storage :file #local
    process resize_to_fill: [300, 300]
  else
    storage :fog #S3
    process resize_to_fill: [300, 300]
  end

end