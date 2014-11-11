require 'spec_helper'

describe HotelsController do

  describe 'when user is signed in' do
    let(:user) { FactoryGirl.create(:user) }
    before { sign_in user }

    describe 'GET new' do
      it 'renders new hotel\'s template' do
        get :new
        expect(response).to render_template(:new)
      end
    end
  end
end
