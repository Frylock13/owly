class Setting < ActiveRecord::Base


  validates :key, presence: true
  validates :key, uniqueness: true

  # SETTINGS = ( tags )
  def self.method_missing(m, *args, &block)
    Setting.find_by(key: m).value
  end
end
