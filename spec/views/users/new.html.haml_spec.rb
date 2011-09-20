require 'spec_helper'

describe '/users/new' do
  
  before(:each) do
    @user = User.new
  end
  
  it "should display username field in the new user form" do
    render
    rendered.should have_selector("label[for='user_username']")
  end
end
