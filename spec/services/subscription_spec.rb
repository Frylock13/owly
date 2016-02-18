describe Subscription do

  let!(:subscription) { CreateSubscription.call(email: 'test@gmail.com') }

  describe 'Creating' do
    it "checks the creating of subscription" do
      existing_sub = CreateSubscription.call(email: 'another@gmail.com')
      expect(existing_sub).to eq true
    end

    it 'checks the validation fail if email exists' do
      existing_sub = CreateSubscription.call(email: 'test@gmail.com')
      expect(existing_sub).to eq false
    end

    it 'checks the generating default key' do
      last_sub = Subscription.last
      expect(last_sub.key).not_to be_nil
    end
  end

  describe 'Removing' do
    let(:last_sub) { Subscription.last }

    it 'checks the removing subscription' do
      RemoveSubscription.call(last_sub.key)
      expect(Subscription.count).to eq 0 # because sub has been destroyed
    end

    it 'checks the fail removing if invalid key' do
      RemoveSubscription.call('some_invalid_key')
      expect(Subscription.count).to eq 1 # because sub has been destroyed
    end
  end

end