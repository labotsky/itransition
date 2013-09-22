FactoryGirl.define do
  factory :user do
    email                 "example@yahoo.com"
    password              "password"
    password_confirmation "password"
    confirmed_at           Time.now
  end
end