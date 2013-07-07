FactoryGirl.define do

  factory :user do
    sequence(:email) {|n| "John#{n}@example.com" }
    name "John"
    password "password"
    password_confirmation "password"
  end

  factory :team do
    sequence(:name) {|n| "Team #{n}" }
  end
end