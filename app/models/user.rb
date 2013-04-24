class User < ActiveRecord::Base
  attr_accessible :password, :username, :is_logged_in,
  	:max_scores, :quizzes

  has_many :max_scores
  has_many :quizzes, :through => :max_scores
  
end

# class Registrant < ActiveRecord::Base
#   attr_accessible :code, :email_address, :expires_at
  
#   before_create :add_code
  
#   private
  
#   def add_code
#     self.code = SecureRandom.urlsafe_base64
#     self.expires_at = DateTime.now + 1
#   end
# end