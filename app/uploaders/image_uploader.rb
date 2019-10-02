class ImageUploader < CarrierWave::Uploader::Base

  #carrierwave内でminimagickを使用する
  include CarrierWave::MiniMagick

  #リサイズ
  process resize_to_fill: [300, 300, "Center"]

  # 本番環境とローカルで保存先を分ける
  if Rails.env.development? || Rails.env.test?
    storage :file #local
  else
    storage :fog #S3
  end

end