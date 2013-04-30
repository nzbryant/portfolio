class Category < ActiveRecord::Base
  attr_accessible :name, :subcategories, :subcategories_attributes



  has_many :quizzes, :through => :subcategories	  
  has_many :subcategories
	accepts_nested_attributes_for :subcategories, :reject_if => :all_blank, :allow_destroy => true

end
