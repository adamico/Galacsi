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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150711094004) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alternativeships", force: :cascade do |t|
    t.integer  "fiche_id"
    t.integer  "alternative_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "alternativeships", ["fiche_id", "alternative_id"], name: "index_alternativeships_on_fiche_id_and_alternative_id", unique: true, using: :btree

  create_table "classe_therapeutiques", force: :cascade do |t|
    t.string   "name",                  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "classifications_count",             default: 0
    t.string   "slug",                  limit: 255
  end

  add_index "classe_therapeutiques", ["slug"], name: "index_classe_therapeutiques_on_slug", unique: true, using: :btree

  create_table "classifications", force: :cascade do |t|
    t.integer  "dci_id"
    t.integer  "classe_therapeutique_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "classifications", ["dci_id", "classe_therapeutique_id"], name: "index_classifications_on_dci_id_and_classe_therapeutique_id", unique: true, using: :btree

  create_table "compositions", force: :cascade do |t|
    t.integer  "dci_id"
    t.integer  "specialite_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "compositions", ["dci_id", "specialite_id"], name: "index_compositions_on_dci_id_and_specialite_id", unique: true, using: :btree

  create_table "dcis", force: :cascade do |t|
    t.string   "name",                  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cached_slug",           limit: 255
    t.integer  "classifications_count",             default: 0
    t.integer  "fiches_count",                      default: 0
    t.string   "slug",                  limit: 255
    t.integer  "compositions_count",                default: 0
  end

  add_index "dcis", ["cached_slug"], name: "index_dcis_on_cached_slug", using: :btree
  add_index "dcis", ["slug"], name: "index_dcis_on_slug", unique: true, using: :btree

  create_table "decisions", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "abbr",        limit: 255
  end

  create_table "demandes", force: :cascade do |t|
    t.string   "nature",     limit: 255
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "contexte"
    t.string   "demandeur",  limit: 255
  end

  create_table "distinctions", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fiches", force: :cascade do |t|
    t.string   "name",                  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",                 limit: 255, default: "brouillon"
    t.integer  "decision_id"
    t.date     "validation_date"
    t.text     "commentaire"
    t.text     "distinction_name"
    t.integer  "dci_id"
    t.string   "suivi",                 limit: 255
    t.date     "revalider_le"
    t.text     "ei"
    t.text     "conditions"
    t.text     "surveillance"
    t.string   "biodisponibilite",      limit: 255
    t.string   "dose_par_rapport_dmap", limit: 255
    t.string   "dose_par_rapport_dp",   limit: 255
    t.string   "liaison_pp",            limit: 255
    t.string   "vol_dist",              limit: 255
    t.string   "tmax",                  limit: 255
    t.string   "thalf",                 limit: 255
    t.string   "pm",                    limit: 255
    t.string   "passage_lait",          limit: 255
    t.string   "rapport_lp",            limit: 255
    t.boolean  "has_poso_pedia"
    t.boolean  "metabolites_actifs"
    t.boolean  "risque_accumulation"
    t.boolean  "risque_dim_lactation"
    t.string   "poso_pedia_des",        limit: 255
    t.text     "arg_autre"
    t.integer  "distinction_id"
    t.text     "ei_theoriques"
    t.boolean  "de_choix"
    t.string   "pic_lacte",             limit: 255
    t.string   "poso_pedia_dose",       limit: 255
    t.integer  "user_id"
    t.text     "articles"
    t.date     "published_at"
  end

  add_index "fiches", ["dci_id"], name: "index_fiches_on_dci_id", using: :btree
  add_index "fiches", ["decision_id"], name: "index_produits_on_decision_id", using: :btree
  add_index "fiches", ["distinction_id"], name: "index_fiches_on_distinction_id", using: :btree
  add_index "fiches", ["published_at"], name: "index_fiches_on_published_at", using: :btree
  add_index "fiches", ["revalider_le"], name: "index_fiches_on_revalider_le", using: :btree
  add_index "fiches", ["state"], name: "index_fiches_on_state", using: :btree
  add_index "fiches", ["user_id"], name: "index_fiches_on_user_id", using: :btree

  create_table "fiches_sources", id: false, force: :cascade do |t|
    t.integer "fiche_id"
    t.integer "source_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",           limit: 255, null: false
    t.integer  "sluggable_id",               null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope",          limit: 255
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "pages", force: :cascade do |t|
    t.string   "permalink",  limit: 255
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title",      limit: 255
  end

  create_table "slugs", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.integer  "sluggable_id"
    t.integer  "sequence",                   default: 1, null: false
    t.string   "sluggable_type", limit: 40
    t.string   "scope",          limit: 255
    t.datetime "created_at"
  end

  add_index "slugs", ["name", "sluggable_type", "sequence", "scope"], name: "index_slugs_on_n_s_s_and_s", unique: true, using: :btree
  add_index "slugs", ["sluggable_id"], name: "index_slugs_on_sluggable_id", using: :btree

  create_table "sources", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "nature",     limit: 255
    t.string   "url",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sourcings", force: :cascade do |t|
    t.integer  "fiche_id"
    t.integer  "source_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sourcings", ["fiche_id", "source_id"], name: "index_sourcings_on_fiche_id_and_source_id", unique: true, using: :btree

  create_table "specialites", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "compositions_count"
    t.string   "slug",               limit: 255
  end

  add_index "specialites", ["slug"], name: "index_specialites_on_slug", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",              limit: 255, default: "", null: false
    t.string   "encrypted_password", limit: 128, default: "", null: false
    t.string   "password_salt",      limit: 255, default: "", null: false
    t.integer  "sign_in_count",                  default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip", limit: 255
    t.string   "last_sign_in_ip",    limit: 255
    t.string   "username",           limit: 255
    t.string   "role",               limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
  end

  add_foreign_key "alternativeships", "dcis", column: "alternative_id", name: "alternativeships_alternative_id_fk"
  add_foreign_key "alternativeships", "fiches"
  add_foreign_key "classifications", "classe_therapeutiques", name: "classifications_classe_therapeutique_id_fk"
  add_foreign_key "classifications", "dcis", name: "classifications_dci_id_fk"
  add_foreign_key "compositions", "dcis", name: "compositions_dci_id_fk"
  add_foreign_key "compositions", "specialites", name: "compositions_specialite_id_fk"
  add_foreign_key "fiches", "dcis", name: "fiches_dci_id_fk"
  add_foreign_key "fiches", "decisions", name: "fiches_decision_id_fk"
  add_foreign_key "fiches", "distinctions", name: "fiches_distinction_id_fk"
  add_foreign_key "fiches", "users", name: "fiches_user_id_fk"
  add_foreign_key "sourcings", "fiches", name: "sourcings_fiche_id_fk"
  add_foreign_key "sourcings", "sources", name: "sourcings_source_id_fk"
end
