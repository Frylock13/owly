class SubscriptionRestoreService < SubscriptionService

  def initialize(options)
    @subscription = Subscription.find_by(email: options[:email])
    super
  end

  def call
    @subscription.active!
    restore_subscription(@subscription.email)
  end

  private

  def restore_subscription(email)
    @mailchimp.lists(@mailchimp_list_id).members(get_md5(email)).update(body: { status: "subscribed" })
  end
end
