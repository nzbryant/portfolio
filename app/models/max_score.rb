class MaxScore < ActiveRecord::Base
  attr_accessible :score, :user, :quiz

  belongs_to :user
  belongs_to :quiz
end
