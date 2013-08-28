class Item < ActiveRecord::Base

  attr_reader :image_crop_data
  validates :price, numericality: { greater_than: 0, allowed_nil: true}
  validates :name, presence: true

  # можно посмотреть в каких корзинах есть товар
  has_many :positions
  has_many :carts, through: :positions

  has_many :comments, as: :commentable
  has_one :image, as: :imageable
  
  after_save :save_image

  # mount_uploader :file, ImageUploader
  
  # def crop_image!(c)
  #   c.each { |k,v| c[k] = v.to_i}
  #   p c
  #   @image_crop_data = c
  #   image.recreate_versions!
  # end

  # def image=(i)
  # 	if !image || !new_record?
  # 	  @image = Image.create(i.merge({imageable: self}))
  # 	end
  # end

  # def save_image

  # end

end 
