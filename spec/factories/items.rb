FactoryBot.define do
  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.png'), filename: 'test.png', content_type: 'image/png')
    end
    association :user
    name              {"kamera"}
    description       {"aaa"}
    price             {1000}
    category_id       {1}
    status_id         {1}
    cost_id           {1}
    prefecture_id     {1}
    delivery_id       {1}  
  end
end
