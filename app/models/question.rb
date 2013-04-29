class Question < ActiveRecord::Base
  attr_accessible :text, :quiz, :answers, :keywords, :answers_attributes

  

  belongs_to :quiz
  has_many :answers
  accepts_nested_attributes_for :answers, :reject_if => :all_blank, :allow_destroy => true
  
  has_many :keywords

  validates :text, :presence => true

end
