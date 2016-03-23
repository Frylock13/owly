class SubscriptionService

  def initialize(email)
    @email = email
    @mailchimp = MailchimpService.object
    @mailchimp_list_id = MailchimpService.list_id
  end
end