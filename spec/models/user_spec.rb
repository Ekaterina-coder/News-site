# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'if user is trying to add existing variables' do
    let(:user_data) do
      {
        email: 'test@email.com',
        password: '123456',
        password_confirmation: '123456'
      }
    end

    it 'should return false' do
      fake_user = User.new(user_data)
      fake_user.save if exs = User.find_by(email: 'test@email.com').nil?
      another_fake = User.new(user_data)
      expect(another_fake.valid?).to be_falsy
      fake_user.destroy if exs.nil?
    end
  end
end
