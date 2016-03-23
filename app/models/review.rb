class Review < ActiveRecord::Base

  enum status: %w( pending approved )

  belongs_to :product
  
  validates :name, :email, :text, :rating, presence: true
  validates :rating, inclusion: { in: 1..5 }, allow_nil: true
end
