class Subcategory < ActiveRecord::Base
  attr_accessible :name, :quizzes, :category, :quizzes_attributes

  has_many :quizzes
  belongs_to :category

  accepts_nested_attributes_for :quizzes, :reject_if => :all_blank, :allow_destroy => true
end
