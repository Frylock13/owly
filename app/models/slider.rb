class Slider < ActiveRecord::Base

  has_attached_file :image, styles: { preview: "90x65", full: "100%" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  scope :enable, -> { where(enable: true) }
end
