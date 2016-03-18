class Order < ActiveRecord::Base

  enum status: %w( pending shipped completed cancelled )

  validates :name, :email, :products, presence: true

  scope :only_legal_entity, -> { where.not(invoice_key: nil) }
end
