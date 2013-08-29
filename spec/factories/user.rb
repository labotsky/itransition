FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "person_#{n}@example.com"}
    sequence(:password) {"123456789"}
    sequence(:password_confirmation) {"123456789"}
  end
end