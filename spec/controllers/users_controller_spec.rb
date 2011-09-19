require 'spec_helper'

describe UsersController do
  
  describe "GET show" do
    
    it "should get show page successfully" do
      get :show
      response.should be_success
    end
  end
  
  describe "GET new" do
    it "should get the new page successfully and assign a user" do
      get :new
      response.should be_success
      assigns[:user].should == User.new
    end
  end
end
