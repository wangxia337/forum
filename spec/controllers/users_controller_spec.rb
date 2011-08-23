require 'spec_helper'

describe UsersController do
  
  describe "GET show" do
    
    it "should get show page successfully" do
      get :show
      response.should be_success
    end
  end
end
