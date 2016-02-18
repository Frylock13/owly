class RemoveSubscription

  def self.call(key)
    subscription = Subscription.find_by(key: key)
    subscription ? subscription.destroy : false
  end

end