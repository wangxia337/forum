# encoding: utf-8
require 'spec_helper'

describe UsersController do
  
  # describe "GET show" do
  #   
  #   it "should get show page successfully" do
  #     get :show
  #     response.should be_success
  #   end
  # end
  
  let(:user_attr) {
    {
      :username => "wangxia",
      :email => "michellewang514@gmail.com",
      :password => "password",
      :password_confirmation => "password"
    }
  }
  
  describe "GET new" do
    it "should get the new page successfully and assign a user" do
      get :new
      response.should be_success
    end
  end
  
  describe "POST create" do
    it "should create a new member" do
      lambda do
        post :create, :user => user_attr
        flash[:notice].should == "注册成功，欢迎加入我们！"
        response.should redirect_to(user_path(assigns(:user)))
       end.should change(User, :count).by(1)
    end
    
    it "should not create a new member when has error" do
      lambda do
        post :create, :user => user_attr.merge(:username => nil)
        assigns(:user).errors[:username].should be_true
        response.should be_success
        response.should render_template('new')
      end.should_not change(User, :count)
    end
  end
end
