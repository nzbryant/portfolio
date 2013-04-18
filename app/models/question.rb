class Question < ActiveRecord::Base
  attr_accessible :text

  belongs_to :quiz
  has_many :answers
  has_many :keywords

end
