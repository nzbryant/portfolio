class Quiz < ActiveRecord::Base
  attr_accessible :created, :description,
   :is_private, :title, :subcategory, :user, :questions, :keywords, :max_scores
   

  belongs_to :subcategory
  belongs_to :user
  has_many :questions
  has_many :keywords
  has_many :max_scores
  has_many :users, :through => :max_scores


end
