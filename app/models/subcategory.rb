class Subcategory < ActiveRecord::Base
  attr_accessible :name, :quizzes, :category

  has_many :quizzes
  belongs_to :category
end
