class ScoringField < ActiveRecord::Base
  belongs_to :game, foreign_key: "game_id"
  serialize :options, Array

  def options_list
    options.join(", ")
  end

  def options_list=(input)
    self.options = input.gsub(", ", ",").split(",")
  end

  SCORING_FIELD_TYPES = ["text", "number", "boolean", "radio_set", "range"]
end
