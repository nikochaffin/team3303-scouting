class ScoringField < ActiveRecord::Base
  belongs_to :game, foreign_key: "game_id"

  SCORING_FIELD_TYPES = ["text", "number", "range"]
end
