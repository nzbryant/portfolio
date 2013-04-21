keclass Keyword < ActiveRecord::Base
  attr_accessible :text, :quiz, :question

  belongs_to :quiz
  belongs_to :question

end
