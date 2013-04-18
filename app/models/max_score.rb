class MaxScore < ActiveRecord::Base
  attr_accessible :score, :user, :test

  belongs_to :user
  belongs_to :test
end
