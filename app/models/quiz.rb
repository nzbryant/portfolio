class Quiz < ActiveRecord::Base
  attr_accessible :created, :description,
   :is_private, :title, :subcategory, :user, :questions, :keywords, :max_scores, :questions_attributes

   
  belongs_to :subcategory
  belongs_to :user
  
  has_many :questions
  accepts_nested_attributes_for :questions, :reject_if => :all_blank, :allow_destroy => true
  
  has_many :keywords
  has_many :max_scores
  has_many :users, :through => :max_scores

  validates :title, :presence => true

end
