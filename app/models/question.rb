class Question < ActiveRecord::Base

  validates :name, :tel, :text, presence: true

end
