class Soccer::PositionUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave

  version :standard do
    process :eager => true
    process :resize_to_fill => [100, 150, :north]
  end

  version :thumbnail do
    process :resize_to_fill => [150, 150]
  end

  def public_id
    return "#{model.id}-#{DateTime.now.to_time.to_i}"
  end

end
