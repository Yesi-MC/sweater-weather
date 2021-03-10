require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :password }
    it { should validate_presence_of :api_key }
  end

  describe 'instance methods' do 
    it 'can generate api key' do 
      user = User.new(email: "user@gmail.com", password: "password")

      expect(user.generate_key).to be_a(String)
      expect(user.generate_key.length).to eq(24)
    end
  end
end 