require 'spec_helper'

describe Hotel do
  let(:user) { FactoryGirl.create(:user) }
  before do
    @hotel = user.hotels.build(
      title: 'Fan',
      stars_rating: 3,
      breakfast_included: true,
      room_description: 'gghgc',
      photo: 'Sory',
      price_for_room: 298
    )
  end
  subject { @hotel }
  it { should respond_to(:title) }
  it { should respond_to(:stars_rating) }
  it { should respond_to(:breakfast_included) }
  it { should respond_to(:room_description) }
  it { should respond_to(:photo) }
  it { should respond_to(:price_for_room) }
  it { should respond_to(:rating_hotel) }
  it { should respond_to(:user_id) }
  it { should be_valid }

  describe 'with blank title' do
    before { @hotel.title =  '' }
    it { should_not be_valid }
  end

  describe 'blank stars_rating' do
    before { @hotel.stars_rating = '' }
    it { should_not be_valid }
  end

  describe 'too long title' do
    before { @hotel.title = 'h' * 41 }
    it { should_not be_valid }
  end

  describe 'too long room_description' do
    before { @hotel.room_description = '4' * 501 }
    it { should_not be_valid }
  end

  describe 'stars rating = 6' do
    before { @hotel.stars_rating = 6 }
    it { should_not be_valid }
  end
end
