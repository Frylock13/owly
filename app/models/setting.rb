class Setting < ActiveRecord::Base

  SETTINGS = %w( blog_tags
                 mailchimp_key 
                 mailchimp_list_id 
                 admin_email )

  validates :key, :value, presence: true
  validates :key, uniqueness: true

  SETTINGS.each do |method|
    define_singleton_method(method) do
      Setting.find_by(key: method).value
    end
  end
end
