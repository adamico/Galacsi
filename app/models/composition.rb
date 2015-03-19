class Composition < ActiveRecord::Base
  belongs_to :dci, counter_cache: true
  belongs_to :specialite, counter_cache: true
end
