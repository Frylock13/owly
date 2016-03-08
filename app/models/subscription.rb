class Subscription < ActiveRecord::Base

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }

  enum status: [:active, :inactive]
end
