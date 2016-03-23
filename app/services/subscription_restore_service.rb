class SubscriptionRestoreService < SubscriptionService

  def initialize(email)
    super
  end

  def call
    restore_subscription(@email)
  end

  private

  def restore_subscription(email)
    @mailchimp.lists(@mailchimp_list_id).members(generate_md5(email)).update(body: { status: "subscribed" })
  end

  def generate_md5(email)
    Digest::MD5.hexdigest(email)
  end
end
