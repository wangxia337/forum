# encoding: utf-8
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
    rendered.should have_selector("input[id='user_password'][type='password']")
  end
  
  it "should display password confirmation field in the new user form" do
    render
    rendered.should have_selector("label[for='user_password_confirmation']")
    rendered.should have_selector("input[id='user_password_confirmation'][type='password']")
  end
  
  it "should display gender select in the new user form" do
    render
    rendered.should have_selector("label[for='user_gender']")
    rendered.should have_selector("select[id='user_gender'] option[value='']", :content => '请选择性别')
    rendered.should have_selector("select[id='user_gender'] option[value='男']", :content => '男')
    rendered.should have_selector("select[id='user_gender'] option[value='女']", :content => '女')
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
  
  it "should display question select in the new user form" do
    render
    rendered.should have_selector("label[for='user_question']")
    rendered.should have_selector("select[id='user_question'] option[value='']", :content => '请选择问题')
    rendered.should have_selector("select[id='user_question'] option[value='你的生日是？']", :content => '你的生日是？')
    rendered.should have_selector("select[id='user_question'] option[value='你爸爸的名字是？']", :content => '你爸爸的名字是？')
    rendered.should have_selector("select[id='user_question'] option[value='你爸爸的生日是？']", :content => '你爸爸的生日是？')
    rendered.should have_selector("select[id='user_question'] option[value='你妈妈的名字是？']", :content => '你妈妈的名字是？')
    rendered.should have_selector("select[id='user_question'] option[value='你妈妈的生日是？']", :content => '你妈妈的生日是？')
    rendered.should have_selector("select[id='user_question'] option[value='你的家乡是？']", :content => '你的家乡是？')
  end
  
  it "should display answer field in the new user form" do
    render
    rendered.should have_selector("label[for='user_answer']")
    rendered.should have_selector("input[id='user_answer']")
  end
  
end
