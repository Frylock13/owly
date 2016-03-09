class Order < ActiveRecord::Base

  enum status: %w( pending shipped completed cancelled )

  validates :name, :email, :products, presence: true
end
