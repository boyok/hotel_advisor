require 'spec_helper'

describe Comment do
  let(:user) { FactoryGirl.create(:user) }
  let(:hotel) { FactoryGirl.create(:hotel) }
  before do
    @comment = user.comments.create!(
      text_comment: 'Something',
      hotel: hotel,
      hotel_rating: 5
    )
  end

  subject { @comment }
  it { should respond_to(:text_comment) }
  it { should respond_to(:hotel_rating) }
  it { should respond_to(:hotel_id) }
  it { should respond_to(:user_id) }
  it { should be_valid }

  describe 'when text_comment is empty' do
    before { @comment.text_comment = '' }
    it { should be_valid }
  end

  describe 'when text_comment is too long' do
    before { @comment.text_comment = 'a' * 141 }
    it { should_not be_valid }
  end

  describe 'when hotel_rating is not present' do
    before { @comment.hotel_rating = nil }
    it { should_not be_valid }
  end

  describe 'when hotel_rating is not present' do
    before { @comment.hotel_rating = 0 }
    it { should_not be_valid }
  end

  describe 'when user_id is not present' do
    before { @comment.user_id = '' }
    it { should_not be_valid }
  end

  describe 'when hotel_id is not present' do
    before { @comment.hotel_id = '' }
    it { should_not be_valid }
  end
end
