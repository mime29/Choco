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

ActiveRecord::Schema.define(:version => 20120924132234) do

  create_table "arts", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "file"
    t.integer  "gallery_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "arts", ["gallery_id"], :name => "index_arts_on_gallery_id"

  create_table "galleries", :force => true do |t|
    t.string   "title"
    t.string   "subtitle"
    t.integer  "likes"
    t.string   "thumbnail"
    t.integer  "portfolio_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "galleries", ["portfolio_id"], :name => "index_galleries_on_portfolio_id"

  create_table "portfolios", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
