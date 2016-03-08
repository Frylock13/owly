class SubscriptionService

  def initialize(options)
    @mailchimp = MailchimpService.object
    @mailchimp_list_id = MailchimpService.list_id
  end

  def get_md5(email)
    Digest::MD5.hexdigest(email)
  end
end