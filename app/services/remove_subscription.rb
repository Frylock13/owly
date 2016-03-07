class RemoveSubscription

  def initialize(key)
    @subscription = Subscription.find_by(key: key)
  end

  def call
    if @subscription.present?
      @subscription.destroy
      remove_from_mailchimp(@subscription.email)
    else
      false
    end
  end

  private

  def remove_from_mailchimp(email)
    mailchimp.lists(mailchimp_list_id).members(get_md5_email).update(body: { status: "unsubscribed" })
  end

  def mailchimp
    Gibbon::Request.new(api_key: Setting.mailchimp_key)
  end

  def mailchimp_list_id
    Setting.mailchimp_list_id
  end

  def get_md5_email
    Digest::MD5.hexdigest(@subscription.email)
  end
end
