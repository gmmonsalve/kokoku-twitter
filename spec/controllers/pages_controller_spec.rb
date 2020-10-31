require 'rails_helper'

RSpec.describe PagesController, "#home" do
    context "Cuando el usuario está logueado" do
        let(:user){ create(:user) }
        let(:user2){ create(:user) }
        before do
            sign_in user
            user.follow(user2)
            @tweet_user =  Tweet.create(id:1,body:'soy user 1',user_id:user.id,created_at:Time.now)
            get :home
        end
        it "deben listarse sus tuits" do
            expect(assigns(:tweets)).to contain_exactly(@tweet_user)
        end
        it "deben listarse sus tuits + los tuits del followed" do
            @tweet_user2 = Tweet.create(id:2,body:'soy user 2',user_id:user2.id,created_at:Time.now)
            expect(assigns(:tweets)).to contain_exactly(@tweet_user,@tweet_user2)
        end
        it "deben listarse los following users" do
            expect(assigns(:following)).to contain_exactly(user2)
        end
        it "deben listarse los followers users" do
            user2.follow(user)
            expect(assigns(:followers)).to contain_exactly(user2)
        end
    end
end