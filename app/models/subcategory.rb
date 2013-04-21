class Subcategory < ActiveRecord::Base
  attr_accessible :name

  has_many :quizzes
  belongs_to :category
end
