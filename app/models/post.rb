class Post < ActiveRecord::Base

  has_attached_file :image, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  
  validates :title, :text, presence: true

  paginates_per 10
end
