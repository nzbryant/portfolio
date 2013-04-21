class Answer < ActiveRecord::Base
  attr_accessible :is_correct, :text, :question

  belongs_to :question

end
