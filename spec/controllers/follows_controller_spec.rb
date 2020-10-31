require 'rails_helper'

RSpec.describe FollowsController, "#follow" do
    context "Si está logueado" do
        let(:user) {create(:user)}
        let(:user2) {create(:user)}
        before do
            sign_in user
            post :follow, params: {id:user2.id}
        end
        it "debe seguir al usuario2" do
            expect(user.is_following?(user2)).to eq(true)
        end
    end
end
