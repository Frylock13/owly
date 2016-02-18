class AddNewSubscription

  def self.call(email)
    subscription = Subscription.new(email: email)

    if subscription.valid?
      subscription.key = SecureRandom.hex # key for unsubscribe
      subscription.save!
    else
      false
    end
  end
  
end