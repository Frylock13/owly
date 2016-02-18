require 'rails_helper'

RSpec.describe Subscription, type: :model do

  let(:subscription) { FactoryGirl.create(:subscription, email: 'test@gmail.com') }

  it 'checks for valid email' do
    expect(subscription.email).not_to be_nil
  end

  it 'checks for invalid email' do
    subscription = Subscription.new(email: 'asdf')
    expect(subscription).not_to be_valid
  end
end
