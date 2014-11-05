require 'spec_helper'

	describe Comment do
     	let(:user) { FactoryGirl.create(:user) }
 #  		let(:hotel) { FactoryGirl.create(:hotel) }
     	before { @hotel = user.hotels.build(title: "Fan", stars_rating: 3, breakfast_included: true,
    				room_description: "gghgc", photo: "Sory", price_for_room: 298)}
     	subject { @hotel }
    	before { @comment = @hotel.comments.build(text_comment: "Something", hotel_rating: 5) }
  		
  		subject { @comment }
		it { should respond_to(:text_comment) }
		it { should respond_to(:hotel_rating) }
		it { should respond_to(:hotel_id) }		
		it { should respond_to(:user_id) }

		it "create valid comment" do
			n = 1
			5.times do 
				before { @comment = @hotel.comments.build(hotel_rating: n, text_comment: "something") }
				@comment.should be_valid
				n += 1
			end
		end
		
		it "create comment without text" do
			n = 1
			5.times do 
				@comment = @hotel.comments.build(hotel_rating: n, text_comment: "")
				@comment.should be_valid 
				n += 1
			end
		end

	end
		

