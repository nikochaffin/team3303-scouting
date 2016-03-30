class ScoringEntry < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
  serialize :properties, Hash
end
