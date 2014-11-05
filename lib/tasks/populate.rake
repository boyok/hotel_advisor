require 'faker'
namespace :db do
	desc "Erase and fill database"
	task populate: :environment do

 		rake::Task['db:reset'].invoke
		Hotel.populate do |hotel|
			hotel.title = Faker::Name.name
			hotel.room_description = Faker::Lorem.sentences(3..10)
			hotel.stars_rating = 1+rand(5)
			hotel.breakfast_included = (1 == rand(2) ? true : false)
			hotel.price_for_room = Faker::commerce.price
			hotel.created_at = 4.years.ago..Time.now

		end
	end
end