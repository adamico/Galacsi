class Classification < ActiveRecord::Base
  belongs_to :dci, counter_cache: true
  belongs_to :classe_therapeutique, counter_cache: true
end
