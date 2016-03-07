class CreateSubscription

  def initialize(email)
    @subscription = Subscription.new(email: email)
    load_mailchimp_data
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

  def load_mailchimp_data
    @mailchimp = Gibbon::Request.new(api_key: Setting.mailchimp_key)
    @mailchimp_list_id = Setting.mailchimp_list_id
  end
end