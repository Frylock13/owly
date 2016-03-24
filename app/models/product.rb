class Product < ActiveRecord::Base

  belongs_to :category

  has_many :reviews, dependent: :destroy
  has_many :images, dependent: :destroy

  accepts_nested_attributes_for :images, allow_destroy: true

  has_attached_file :image, styles: { small: "100x100", medium: "250x250>", large: "400x400", full: "100%" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :name, :desc, :price, :rating, :category_id, presence: true

  scope :cheapest, -> { order(:price) }
  scope :most_expensive, -> { order('price DESC') }
  scope :newest, -> { order('id DESC') }
  scope :most_popular, -> { order('rating DESC') }

  paginates_per 100
end
