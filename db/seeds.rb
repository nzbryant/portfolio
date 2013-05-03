# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#require "lorem"
require "populator"
#categories

Category.delete_all
Subcategory.delete_all
User.delete_all
Quiz.delete_all
Question.delete_all
Answer.delete_all

cat1 = Category.create :name => "Programming"
cat2 = Category.create :name => "Language"
cat3 = Category.create :name => "Business"
cat4 = Category.create :name => "Acquisitions"
cat5 = Category.create :name => "Mining"

subcat1 = Subcategory.create :name => "Rails", :category => cat1
subcat2 = Subcategory.create :name => "J-Query", :category => cat1
subcat3 = Subcategory.create :name => "UK Takeover Code", :category => cat4
subcat4 = Subcategory.create :name => "Private M&A", :category => cat4

u1 = User.create :username => "Rod", :password => "Jacob_pw", :is_logged_in => true
u2 = User.create :username => "Dave", :password => "A73*_pw", :is_logged_in => true
u3 = User.create :username => "Sara", :password => "sd7OO_pw", :is_logged_in => false

quiz1 = Quiz.create :title => "Intro to Rails", :is_private => false, :subcategory => subcat1, :user => u1
quiz2 = Quiz.create :title => "Selected M&A Basics", :is_private => false, :subcategory => subcat4, :user => u2
quiz3 = Quiz.create :title => "UK Takeover Code Features", :is_private => true, :subcategory => subcat3, :user => u3

q1 = Question.create :text => "What is ActiveRecord?", :quiz => quiz1
q2 = Question.create :text => "What is the most important element of due diligence?", :quiz=> quiz2
q3 = Question.create :text => "What is the threshold ownership over which a public offer for all shares is required?", :quiz => quiz3

a1 = Answer.create :text => "A vinyl record that jumps", :is_correct => false, :question => q1
a2 = Answer.create :text => "Doing a valuation of the business", :is_correct => false, :question => q2
a3 = Answer.create :text => "15%",:is_correct => false,  :question => q3

a4 = Answer.create :text => "Active Record will perform queries on the database for you and is compatible with most database systems", :is_correct => true, :question => q1
a5 = Answer.create :text => "Checking that the accounting records are correct by comparing them with original documents", :is_correct => true, :question => q2
a6 = Answer.create :text => "20%", :is_correct => false, :question=> q3

a7 = Answer.create :text => "A new band from Detroit", :is_correct => false, :question => q1
a8 = Answer.create :text => "Talking with management", :is_correct => false, :question => q2
a9 = Answer.create :text => "30%", :is_correct => true, :question=> q3

 Category.populate 5 do |category|
   category.name = Populator.words(1..3).titleize
 end

Category.all.each do |category| 
	(1..5).to_a.each do 
		sub = Subcategory.create(
			:name => (0...8).map{(65+rand(26)).chr}.join.titleize + " " + (0...8).map{(65+rand(26)).chr}.join.titleize,
			:category => category
		)
	end
end

Subcategory.all.each do |subcategory| 
	(1..4).to_a.each do 
		qu = Quiz.create(
			:title => (0...8).map{(65+rand(26)).chr}.join.titleize + " " + (0...8).map{(65+rand(26)).chr}.join.titleize,
			:subcategory => subcategory,
			:is_private => :false
		)
	end
end

Quiz.all.each do |quiz| 
	(1..4).to_a.each do 
		qz = Question.create(
			:text => (0...8).map{(65+rand(26)).chr}.join.titleize + " " + (0...8).map{(65+rand(26)).chr}.join.titleize,
			:quiz => quiz
		)
	end
end

Question.all.each do |question| 
		ans = Answer.create(
			:text => "hint - pick me " + (0...8).map{(65+rand(26)).chr}.join.titleize + " " + (0...8).map{(65+rand(26)).chr}.join.titleize,
			:is_correct => true,
			:question => question
		)
		ans = Answer.create(
			:text =>  (0...8).map{(65+rand(26)).chr}.join.titleize + " " + (0...8).map{(65+rand(26)).chr}.join.titleize,
			:is_correct => false,
			:question => question
		)
		ans = Answer.create(
			:text => (0...8).map{(65+rand(26)).chr}.join.titleize + " " + (0...8).map{(65+rand(26)).chr}.join.titleize,
			:is_correct => false,
			:question => question
		)
	end

