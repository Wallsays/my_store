class Image < ActiveRecord::Base
  attr_accessible :file, :imageable_id, :imageable_type, :imageable
  mount_uploader :file, ImageUploader
  belongs_to :imageable, polymorphic: true
end
