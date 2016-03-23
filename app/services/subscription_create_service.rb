class SubscriptionCreateService < SubscriptionService

  def initialize(email)
    super
  end

  def call
    add_to_mailchimp(@email)
  end

  private

  def add_to_mailchimp(email)
    @mailchimp.lists(@mailchimp_list_id).members.create(body: { email_address: email, status: "subscribed" })
  end
end