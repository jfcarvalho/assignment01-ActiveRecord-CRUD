class User < ActiveRecord::Base 
	attr_accessor :username 
	attr_accessor :password_digest 
end
