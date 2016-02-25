class Product < ActiveRecord::Base
  belongs_to :category

  has_attached_file :image, styles: { medium: "250x250>", large: "400x400" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  scope :cheapest, -> { order(:price) }
  scope :most_expensive, -> { order('price DESC') }
  scope :newest, -> { order(:id) }
  scope :most_popular, -> { order('rating DESC') }
end
