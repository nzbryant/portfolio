class User < ActiveRecord::Base
  attr_accessible :password, :username, :is_logged_in,
  	:max_scores, :quizzes

  has_many :max_scores
  has_many :quizzes, :through => :max_scores
  
end
