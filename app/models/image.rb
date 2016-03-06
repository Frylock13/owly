class Image < ActiveRecord::Base
  
  belongs_to :product

  has_attached_file :picture, styles: { small: "100x100", medium: "250x250>", large: "400x400" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end
