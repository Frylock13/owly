class Setting < ActiveRecord::Base
  
  validates :key, presence: true
  # KEYS = mailchimp_key, mailchimp_list_id

  def self.method_missing(m, *args, &block)
    Setting.find_by(key: m).value
  end  
end
