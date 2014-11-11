FactoryGirl.define do
  factory :user do
    name 'boyok'
    email 'boyok@gmail.com'
    password 'foobar'
    password_confirmation 'foobar'
  end

  factory :hotel do
    title 'hotel'
    stars_rating 4
    room_description 'description'
    photo 'hjk'
    price_for_room 200
  end
end
