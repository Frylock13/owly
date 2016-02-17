class Category < ActiveRecord::Base
  has_attached_file :preview, styles: { medium: "280x280>" }, default_url: "/images/:style/missing.png"
  has_attached_file :background
  validates_attachment_content_type :preview, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :background, content_type: /\Aimage\/.*\Z/

  has_many :products, dependent: :destroy
end
