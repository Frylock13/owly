class Category < ActiveRecord::Base

  extend FriendlyId
  friendly_id :name, use: :slugged

  has_attached_file :preview, styles: { small: "50x50", medium: "280x280>" }, default_url: "/images/:style/missing.png"
  has_attached_file :background
  
  validates_attachment_content_type :preview, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :background, content_type: /\Aimage\/.*\Z/

  validates :name, :desc, :slug, presence: true
  validates :name, :slug, uniqueness: true
  
  has_many :products, dependent: :destroy
  
  scope :only_parents, -> { where(parent_id: nil) }

  acts_as_tree order: 'name'

  paginates_per 20
end
