class User < ActiveRecord::Base
	has_many :articles
	has_secure_password
	before_save {self.email = email.downcase}
	
	validates :username, 
			presence: true, uniqueness: {case_sensitive: false},
			length: {minimum: 3, maximum: 25}
	
	VALID_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-.]{1,50}\.[a-z]{2,10}\z/i
	
	validates :email,
			presence: true, uniqueness: {case_sensitive: false},
			length: {minimum: 3, maximum: 50},
			format: {with: VALID_EMAIL_REGEX}

end