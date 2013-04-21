# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


cat1 = Category.create :name => "Programming"
cat2 = Category.create :name => "Language"
cat3 = Category.create :name => "Business"
cat4 = Category.create :name => "Acquisitions"
cat5 = Category.create :name => "Mining"


