require 'spec_helper'

describe 'Hotel pages' do
  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }
  subject { page }

  describe 'add new hotel' do
    before { visit new_hotel_path }
    it { should have_content 'Add new hotel' }

    describe 'with invalid information' do
      it 'should not add new hotel' do
        expect { click_button 'Add new hotel' }.not_to change(Hotel, :count)
      end
    end

    describe 'with valid information' do
      before { fill_in 'Title hotel', with: 'Fan' }
      it 'should add new a hotel' do
        expect { click_button 'Add new hotel' }.to change(Hotel, :count).by(1)
      end
    end
  end
end
