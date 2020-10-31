FactoryBot.define do
    factory :user do
        sequence(:username)
        sequence(:email){|n| "user_#{n}@uninorte.edu.co"}
        sequence(:password){|n| "encryoted_password_#{n}"}
        created_at { Time.now }
        updated_at { Time.now }
        confirmed_at { Time.now }
    end
end