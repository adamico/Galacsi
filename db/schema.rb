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

ActiveRecord::Schema.define(:version => 20130227154211) do

  create_table "alternativeships", :force => true do |t|
    t.integer  "fiche_id"
    t.integer  "alternative_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "classe_therapeutiques", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "stripped_name"
    t.integer  "classifications_count", :default => 0
  end

  create_table "classifications", :force => true do |t|
    t.integer  "dci_id"
    t.integer  "classe_therapeutique_id"
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
    t.string   "stripped_name"
    t.integer  "classifications_count", :default => 0
    t.integer  "fiches_count",          :default => 0
    t.string   "slug"
  end

  add_index "dcis", ["slug"], :name => "index_dcis_on_slug"

  create_table "decisions", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "abbr"
  end

  create_table "demandes", :force => true do |t|
    t.string   "nature"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "contexte"
    t.string   "demandeur"
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
    t.string   "dose_par_rapport_dmap"
    t.string   "dose_par_rapport_dp"
    t.string   "liaison_pp"
    t.string   "vol_dist"
    t.string   "tmax"
    t.string   "thalf"
    t.string   "pm"
    t.string   "passage_lait"
    t.string   "rapport_lp"
    t.boolean  "has_poso_pedia"
    t.boolean  "metabolites_actifs"
    t.boolean  "risque_accumulation"
    t.boolean  "risque_dim_lactation"
    t.string   "poso_pedia_des"
    t.text     "arg_autre"
    t.integer  "distinction_id"
    t.text     "ei_theoriques"
    t.boolean  "de_choix"
    t.string   "pic_lacte"
    t.string   "poso_pedia_dose"
    t.integer  "user_id"
    t.text     "articles"
    t.date     "published_at"
  end

  add_index "fiches", ["decision_id"], :name => "index_produits_on_decision_id"

  create_table "fiches_sources", :id => false, :force => true do |t|
    t.integer "fiche_id"
    t.integer "source_id"
  end

  create_table "pages", :force => true do |t|
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "slug"
  end

  add_index "pages", ["slug"], :name => "index_pages_on_slug"

  create_table "slugs", :force => true do |t|
    t.string   "name"
    t.integer  "sluggable_id"
    t.integer  "sequence",                     :default => 1, :null => false
    t.string   "sluggable_type", :limit => 40
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "slugs", ["name", "sluggable_type", "sequence", "scope"], :name => "index_slugs_on_n_s_s_and_s", :unique => true
  add_index "slugs", ["sluggable_id"], :name => "index_slugs_on_sluggable_id"

  create_table "sources", :force => true do |t|
    t.string   "name"
    t.string   "nature"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sourcings", :force => true do |t|
    t.integer  "fiche_id"
    t.integer  "source_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "specialites", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "stripped_name"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                             :default => "", :null => false
    t.string   "encrypted_password", :limit => 128, :default => "", :null => false
    t.string   "password_salt",                     :default => "", :null => false
    t.integer  "sign_in_count",                     :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
  end

end
