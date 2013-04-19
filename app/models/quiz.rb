class Quiz < ActiveRecord::Base
  attr_accessible :created, :description,
   :is_private, :title, :category, :user, :questions, :keywords, :max_scores
   

  belongs_to :category
  belongs_to :user
  has_many :questions
  has_many :keywords
  has_many :max_scores
  has_many :users, :through => :max_scores


end
