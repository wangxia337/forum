require 'spec_helper'

describe User do
  let(:attr) {
    {
      :username => "xia",
      :email => "michellewang514@gmail.com",
      :password => "password",
      :password_confirmation => "password"
    }
  }
  
  describe "validation" do
    
    describe "validation username" do
      it "should require a username" do
        no_name_user = User.new(attr.merge(:username => ""))
        no_name_user.should_not be_valid
      end
      
      it "should invalid when the length of username less than 3" do
        shortname = "A" * 2
        short_name_user = User.new(attr.merge(:username => shortname))
        short_name_user.should_not be_valid
      end
      
      it "should invalid when the length of username greater than 50" do
        longname = "A" * 51
        long_name_user = User.new(attr.merge(:username => longname))
        long_name_user.should_not be_valid
      end
    end
    
    describe "validation email" do
      it "should reuqire a email" do
        no_email_user = User.new(attr.merge(:email => ""))
        no_email_user.should_not be_valid
      end
      
      it "should accept valid email address" do
        addresses = %w[user@foo.com The_user@163.com the_first_user@gmail.com]
        addresses.each do |address|
          vaild_email_user = User.new(attr.merge(:email => address))
          vaild_email_user.should be_valid
        end
      end
      
      it "should reject invalid email address" do
        addresses = ["user", "hello user@gmail.com", "hello_user@gamil.com.", "user@gmail.123", "user,hello@gmail.com"]
        addresses.each do |address|
          invalid_email_user = User.new(attr.merge(:email => address))
          invalid_email_user.should_not be_valid
        end
      end
      
      it "should reject duplicate email address" do
        User.create!(attr)
        duplicate_email_user = User.new(attr.merge(:email => "michellewang514@gmail.com"))
        duplicate_email_user.should_not be_valid
      end
      
      it "should reject duplicate email address case sensitive" do
        upcased_email = attr[:email].upcase
        User.create!(attr)
        duplicate_email_user = User.new(attr)
        duplicate_email_user.should_not be_valid
      end
    end
    
    describe "validation password" do
      it "should require a password" do
        no_password_user = User.new(attr.merge(:password => "", :password_confirmation => ""))
        no_password_user.should_not be_valid
      end
      
      it "should filed when password and password_confirmation is inconsistent" do
        password_inconsistent_user = User.new(attr.merge(:password => "user@gmail.com"))
        password_inconsistent_user.should_not be_valid
      end
      
      it "should reject password less than 6 character" do
        short_password = "A" * 5
        short_password_user = User.new(attr.merge(:password => short_password, :password_confirmation => short_password))
        short_password_user.should_not be_valid
      end
      
      it "should reject password greater than 40 character" do
        long_password = "A" * 41
        long_password_user = User.new(attr.merge(:password => long_password, :password_confirmation => long_password))
        long_password_user.should_not be_valid
      end
    end
    
    describe "encrypt password" do
      let(:user) {User.create!(attr)}
      
      it "should has the encrypted password attribute" do
        user.respond_to?(:encrypted_password).should be_true
      end
      
      it "should set the encrypted password" do
        user.encrypted_password.should_not be_blank
      end
    end
    
    it "should create a new instance given vaild attributes" do
      User.create!(attr).should be_true
    end

    it "should return true when has customize feature image" do
      new_user = User.create(attr)
      new_user.feature_image_file_name = "nihao.jpg"
      new_user.has_feature_image?.should == true
    end
  end
end

# == Schema Information
#
# Table name: users
#
#  id                      :integer         not null, primary key
#  username                :string(255)
#  email                   :string(255)
#  encrypted_password      :string(255)
#  salt                    :string(255)
#  feature_image_file_name :string(255)
#  gender                  :string(10)
#  qq_number               :string(20)
#  skype                   :string(255)
#  question                :string(255)
#  answer                  :string(255)
#  created_at              :datetime
#  updated_at              :datetime
#

