class Uploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file
 
  version :thumb do
    process :resize_to_fill => [200,200]
  end

  def store_dir
    'images'
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end