class Question < ActiveRecord::Base

  enum status: %w( active closed )

  validates :name, :tel, :text, presence: true
end
