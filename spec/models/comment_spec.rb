require 'spec_helper'

	describe Comment do
		it "some test spec here" do
			[1,2,3].should_not have(2).items
		end

		it "create valid comment" do
			n = 0
			5.times do 
				@comment_spec = Comment.create(hotel_rating: n, user_comment: "something")
				@comment_spec.should be_valid
				n+1
			end
		end
it "create comment without notes" do
@the_message = Comment.create(star_rating: 5, user_comment: "")
@the_message.should be_valid
end
it "create comment without notes" do
@the_message = Comment.create(star_rating: 1, user_comment: nil)
@the_message.should be_valid
end
it "create comment without notes" do
@the_message = Comment.create(star_rating: 4)
@the_message.should be_valid
end
it "create comment without notes" do
@the_message = Comment.create(star_rating: 0)
@the_message.should_not be_valid
end
it "create comment without rating" do
@the_message = Comment.create(star_rating: nil)
@the_message.should_not be_valid
end
it "create invalid comment" do
@the_message = Comment.create(user_comment: "Here user writes comment")
@the_message.should_not be_valid
end
it "comment is written by user" do
should belong_to(:user)
end
it "comment describes some hotel" do
should belong_to(:hotel)
end
end