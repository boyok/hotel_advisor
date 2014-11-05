module HotelsHelper

	def hotels_ids_in_top
		hotels_ids = Comment.uniq.pluck(:hotel_id)
		hotels = Hotel.find(hotels_ids)
		rating_hotels_and_hotels_ids = Hash.new(0)
		cash_top_hotels = Array.new
		hotels.each do |hotel|
			rating_hotels_and_hotels_ids[hotel.id] = hotel.rating_hotel_by_users
		end
		rating_hotels_and_hotels_ids = rating_hotels_and_hotels_ids.sort_by{|id, rating| rating}.reverse
		count = 1
		rating_hotels_and_hotels_ids.each do |id, rating|
			break if count == 6
			cash_top_hotels.push(id)
			count += 1
		end
		cash_top_hotels
	end

end
