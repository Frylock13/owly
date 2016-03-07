class Review < ActiveRecord::Base

  belongs_to :product
  
  validates :name, :email, :text, :rating, presence: true
  validates :rating, inclusion: { in: 1..5 }, allow_nil: true
end
