class SubscriptionCreateService < SubscriptionService

  def initialize(options)
    @subscription = Subscription.new(email: options[:email]) if options[:email]
    super
  end

  def call
    add_to_mailchimp(@subscription.email)
    @subscription.key = SecureRandom.hex # key for unsubscribe
    @subscription.save
  end

  private

  def add_to_mailchimp(email)
    @mailchimp.lists(@mailchimp_list_id).members.create(body: { email_address: email, status: "subscribed" })
  end
end