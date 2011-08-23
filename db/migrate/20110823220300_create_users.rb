class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :encrypted_password
      t.string :salt
      t.string :feature_image_file_name
      t.string :gender, :limit => 10
      t.string :qq_number, :limit => 20
      t.string :skype
      t.string :question
      t.string :answer
      t.timestamps
    end
  end
  
  def self.down
    drop_table :users
  end
end