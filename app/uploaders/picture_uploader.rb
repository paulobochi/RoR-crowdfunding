# encoding: utf-8

class PictureUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process :tags => ['campaign_picture']
  
  version :thumbnail do
    resize_to_fit(100, 100)
  end

end
