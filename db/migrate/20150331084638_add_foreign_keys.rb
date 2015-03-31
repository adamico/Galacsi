class AddForeignKeys < ActiveRecord::Migration
  def change
    add_foreign_key "alternativeships", "dcis", column: "alternative_id", name: "alternativeships_alternative_id_fk"
    add_foreign_key "alternativeships", "fiches", name: "alternativeships_fiche_id_fk"
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
end
