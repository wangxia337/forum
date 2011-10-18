require 'spec_helper'

describe '/users/new' do
  
  before(:each) do
    @user = User.new
  end
  
  it "should display username field in the new user form" do
    render
    rendered.should have_selector("label[for='user_username']")
    rendered.should have_selector("input[id='user_username']")
  end
  
  it "should display email field in the new user form" do
    render
    rendered.should have_selector("label[for='user_email']")
    rendered.should have_selector("input[id='user_email']")
  end
  
  it "should display password field in the new user form" do
    render
    rendered.should have_selector("label[for='user_password']")
    rendered.should have_selector("input[id='user_password']")
  end
  
  it "should display password confirmation field in the new user form" do
    render
    rendered.should have_selector("label[for='user_password_confirmation']")
    rendered.should have_selector("input[id='user_password_confirmation']")
  end
  
  it "should display gender field in the new user form" do
    render
    rendered.should have_selector("label[for='user_gender']")
    rendered.should have_selector("input[id='user_gender']")
  end
  
  it "should display qq_number field in the new user form" do
    render
    rendered.should have_selector("label[for='user_qq_number']")
    rendered.should have_selector("input[id='user_qq_number']")
  end
  
  it "should display skype field in the new user form" do
    render
    rendered.should have_selector("label[for='user_skype']")
    rendered.should have_selector("input[id='user_skype']")
  end
  
  it "should display question field in the new user form" do
    render
    rendered.should have_selector("label[for='user_question']")
    rendered.should have_selector("input[id='user_question']")
  end
  
  it "should display answer field in the new user form" do
    render
    rendered.should have_selector("label[for='user_answer']")
    rendered.should have_selector("input[id='user_answer']")
  end
  
end
