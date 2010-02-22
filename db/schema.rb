# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100222090503) do

  create_table "alternativeships", :force => true do |t|
    t.integer  "fiche_id"
    t.integer  "alternative_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "compositions", :force => true do |t|
    t.integer  "dci_id"
    t.integer  "specialite_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dcis", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "decisions", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "demandes", :force => true do |t|
    t.string   "type"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "distinctions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fiches", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state"
    t.integer  "decision_id"
    t.date     "validation_date"
    t.text     "commentaire"
    t.text     "distinction_name"
    t.integer  "dci_id"
    t.string   "suivi"
    t.date     "revalider_le"
    t.text     "ei"
    t.text     "conditions"
    t.text     "surveillance"
    t.string   "biodisponibilite"
    t.string   "dose_ingeree"
    t.string   "dose_ingeree_par_rapport"
    t.string   "liaison_pp"
    t.string   "vol_dist"
    t.string   "tmax"
    t.string   "thalf"
    t.string   "pm"
    t.string   "passage_lait"
    t.string   "rapport_lp"
    t.boolean  "poso_pedia"
    t.boolean  "metabolites_actifs"
    t.boolean  "risque_accumulation"
    t.boolean  "risque_dim_lactation"
    t.string   "poso_pedia_des"
    t.text     "arg_autre"
    t.integer  "distinction_id"
  end

  add_index "fiches", ["decision_id"], :name => "index_produits_on_decision_id"

  create_table "fiches_sources", :id => false, :force => true do |t|
    t.integer "fiche_id"
    t.integer "source_id"
  end

  create_table "relationships", :force => true do |t|
    t.integer  "dci_id"
    t.integer  "relation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sources", :force => true do |t|
    t.string   "name"
    t.string   "nature"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "specialites", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
  end

end
