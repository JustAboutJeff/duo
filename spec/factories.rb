FactoryGirl.define do

  factory :user do
    name "John"
    email "JohnDoe@gmail.com"
    password "password"
    password_confirmation "password"
  end

  factory :team do
    name "Channel"
  end
end