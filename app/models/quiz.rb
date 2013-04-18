class Quiz < ActiveRecord::Base
  attr_accessible :created, :description, :is_private, :title

  belongs_to :category
  belongs_to :user
  has_many :questions
  has_many :keywords


end
