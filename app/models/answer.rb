class Answer < ActiveRecord::Base
  attr_accessible :is_correct, :text

  belongs_to :question

end
