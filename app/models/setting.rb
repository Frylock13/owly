class Setting < ActiveRecord::Base

  SETTINGS = %w( tags
                 mailchimp_key 
                 mailchimp_list_id 
                 vkontakte_link
                 facebook_link
                 twitter_link
                 instagram_link
                 contact_email )

  validates :key, presence: true
  validates :key, uniqueness: true

  SETTINGS.each do |method|
    define_singleton_method(method) do
      Setting.find_by(key: method).value
    end
  end
end
