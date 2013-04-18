keclass Keyword < ActiveRecord::Base
  attr_accessible :text

  belongs_to :quiz
  belongs_to :question

end
