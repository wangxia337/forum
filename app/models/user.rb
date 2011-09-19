require 'digest'

class User < ActiveRecord::Base
  
  attr_accessor :password #vritual field, only in the memory
  attr_accessible :username, :email, :password, :password_confirmation
  before_save :encrypt_password
  
  validates :username, :presence => true,
                       :length => {:within => 3..50}
                       
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+.[a-z]\z/i                     
  validates :email, :presence => true,
                    :format => {:with => email_regex},
                    :uniqueness => {:case_sensitive => true}
                    
  validates :password, :confirmation => true,
                       :presence => true,
                       :length => {:within => 6..40}
                       
  private
  
  def encrypt_password
    self.salt = make_salt(password) if new_record?
    self.encrypted_password = encrypt(password)  #assign attribute the self need
  end
  
  def encrypt(password)
    secure_hash("#{salt}--#{password}")
  end
  
  def make_salt(password)
    secure_hash("#{Time.now.utc}--#{password}")
  end
  
  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
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

