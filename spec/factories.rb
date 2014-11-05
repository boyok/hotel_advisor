FactoryGirl.define do
  factory :user do
    name     "boyok"
    email    "boyok@gmail.com"
    password "foobar"
    password_confirmation "foobar"
  end

  factory :hotel do
  	sequence(:title) { |name_hotel| "Hotel #{name_hotel}" }
  	stars_rating 			   4
  	breackfast_included  true
  	room_description		"description"
  	photo					     "sorry"
  	price_for_room			200
  	country					  "France"
    state             "hgjkk"
  	city					    "Paris"
  	street					  "De Brue"
  	user					    :user
  end
end