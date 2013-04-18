# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130418162110) do

  create_table "answers", :force => true do |t|
    t.string   "text"
    t.boolean  "is_correct"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "question_id"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "keywords", :force => true do |t|
    t.string   "text"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "test_id"
    t.integer  "question_id"
  end

  create_table "max_scores", :force => true do |t|
    t.integer  "score"
    t.integer  "user_id"
    t.integer  "test_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "max_scores", ["test_id"], :name => "index_max_scores_on_test_id"
  add_index "max_scores", ["user_id"], :name => "index_max_scores_on_user_id"

  create_table "questions", :force => true do |t|
    t.string   "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "test_id"
  end

  create_table "tests", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.boolean  "is_private"
    t.date     "created"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "category_id"
    t.integer  "user_id"
  end

  create_table "user_tests", :force => true do |t|
    t.integer  "max_score"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
