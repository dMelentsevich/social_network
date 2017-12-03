FactoryGirl.define do
  factory :user do
    name 'User'
    surname 'ByPass'
    sequence(:email) { |n| "person#{n}@example.com" }
    password "test123123"
    confirmed_at Time.now

    trait :with_posts do
      after(:create) do |instance|
        create_list :post, 5, user: instance
      end
    end
  end
end