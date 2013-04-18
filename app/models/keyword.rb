class Keyword < ActiveRecord::Base
  attr_accessible :text

  belongs_to :test
  belongs_to :question

end
