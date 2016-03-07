class CreateSubscription

  def initialize(email)
    @subscription = Subscription.new(email: email)
    @mailchimp = MailchimpService.object
    @mailchimp_list_id = MailchimpService.list_id
  end

  def call
    if add_to_mailchimp(@subscription.email)
      @subscription.key = SecureRandom.hex # key for unsubscribe
      @subscription.save!
    else
      false
    end
  end

  private

  def add_to_mailchimp(email)
    @mailchimp.lists(@mailchimp_list_id).members.create(body: { email_address: email, status: "subscribed" })
  end
end