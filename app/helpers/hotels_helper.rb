module HotelsHelper
	def rating_hotel_by_user#(hotel)
		@rating = 0	
		@count = 0	
		@hotel.comments.each do |comment|
			@rating = @rating + comment.hotel_rating*100
			@count += 1
		end
		@count = 1 if @count.zero?
		#@hotel.comments.count = 1 if @hotel.comments.count.zero?
		#@hotel.rating_hotel_by_user = (@rating/count)*100
		return @rating/@count #@hotel.comments.count
	end

	def top_hotel
		hash_ratings = {}
		@hotels.each do |hotel|
			hash_ratings[hotel_id] = rating_hotel_by_user
		end
		hash_ratings.sort_by{ |key, value| value }
		5.times()
	end



end
