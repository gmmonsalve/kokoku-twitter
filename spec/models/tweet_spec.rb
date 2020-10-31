require 'rails_helper'

RSpec.describe Tweet, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:body) }
    it { should validate_length_of(:body) }
  end
  describe "Associations" do
    it { should belong_to(:user) }
  end
end
