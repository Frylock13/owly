class Picture < ActiveRecord::Base

  belongs_to :product
  has_attached_file :image
end
