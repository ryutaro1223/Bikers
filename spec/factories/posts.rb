FactoryBot.define do
  factory :post do
    post_name       { Faker::Lorem.characters(number:5) }
    caption         { Faker::Lorem.characters(number:20) }
    image_id        { Faker:: Number.between(1,100) }
    user_id         { Faker:: Number.between(1,100) }
    genre_id        { Faker:: Number.between(1,100) }
    created_at      {"now"}
    updated_at      {"now"}
  end
end
