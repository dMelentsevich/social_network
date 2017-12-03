FactoryGirl.define do
  factory :post do
    body 'Post text'
    association :user, factory: :user
  end
end