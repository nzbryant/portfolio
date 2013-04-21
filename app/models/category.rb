class Category < ActiveRecord::Base
  attr_accessible :name, :subcategories

  has_many :subcategories
end
