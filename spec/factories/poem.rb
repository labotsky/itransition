FactoryGirl.define do
  factory :poem do
    name                 "name"
    description          "desc"
    body                 "body"
    user_id 1
  end
end