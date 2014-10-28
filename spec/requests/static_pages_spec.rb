require 'spec_helper'
require 'capybara'
require 'minitest/autorun'

describe "Static pages" do

  subject { page }
  describe "Home page" do
    before { visit root_path }

    it { should have_content('Hotel Advisor') }
    it { should have_title(full_title('')) }
    it { should_not have_title("Home") }
    
     
  end
end
