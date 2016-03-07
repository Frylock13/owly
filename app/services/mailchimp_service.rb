class MailchimpService

  def self.object
    Gibbon::Request.new(api_key: Setting.mailchimp_key)
  end

  def self.list_id
    Setting.mailchimp_list_id
  end
end