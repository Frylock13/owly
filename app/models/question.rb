class Question < ActiveRecord::Base

  enum status: %w( active closed )

  validates :name, :tel, :text, presence: true
  validates :tel, length: { in: 10..15 }
end
