FactoryBot.define do
  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.png'), filename: 'test.png', content_type: 'image/png')
    end
    association :user
    name              { 'kamera' }
    description       { 'aaa' }
    price             { 1000 }
    category_id       { 2 }
    status_id         { 2 }
    cost_id           { 2 }
    prefecture_id     { 2 }
    delivery_id       { 2 }
    user_id           { 2 }
  end
end
