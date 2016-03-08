class SubscriptionRemoveService < SubscriptionService

  def initialize(options)
    @subscription = Subscription.find_by(key: options[:key])
    super
  end

  def call
    if @subscription.present?
      @subscription.inactive!
      remove_from_mailchimp(@subscription.email)
    else
      false
    end
  end

  private

  def remove_from_mailchimp(email)
    @mailchimp.lists(@mailchimp_list_id).members(get_md5(email)).update(body: { status: "unsubscribed" })
  end
end
