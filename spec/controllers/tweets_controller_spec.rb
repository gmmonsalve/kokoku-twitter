require 'rails_helper'

RSpec.describe TweetsController, "#create" do
    context "Tuiteando en blanco" do
        it "Debe lanzar error" do
            expect {Tweet.create!}.to raise_error(ActiveRecord::RecordInvalid)
        end
    end

    context "Cuando el usuario está logueado" do
        let(:user){ create(:user) }
        before do
            sign_in user
            post :create, params: {tweet: {body: "Esto es una prueba", user_id: user.id}}
        end

        it  "Debe crear un nuevo tweet" do
            expect(Tweet.last.user_id).to eq(user.id)
        end

        it "Debe redireccionar al home" do
            expect(subject).to redirect_to home_path_url
        end
        
    end

    context "Cuando el usuario No está logueado" do
        let(:user){ create(:user) }
        before do
            post :create, params: {tweet: {body: "Esto es una prueba", user_id: user.id}}
        end
        it "Debe redireccionar al sign_in" do
            expect(subject).to redirect_to new_user_session_path
        end
    end
end
RSpec.describe TweetsController, "#destroy" do
    context "Cuando el usuario está logueado" do
        let(:user){ create(:user) }
        before do
            sign_in user
            post :create, params: {tweet: {body: "Esto es una prueba", user_id: user.id}}
        end
        it "Debe eliminar su tweet" do
            expect { Tweet.last.destroy }.to change { Tweet.count }.by(-1)
        end
        it "Debe redireccionar al home" do
            expect(subject).to redirect_to home_path_url
        end
    end
end