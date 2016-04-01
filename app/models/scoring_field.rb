class ScoringField < ActiveRecord::Base
  belongs_to :game, foreign_key: "game_id"
  serialize :options, Array
  validates :name, presence: true, length: { minimum: 3 }

  def options_list
    options.join(", ")
  end

  def options_list=(input)
    self.options = input.squeeze(" ").strip.gsub(", ", ",").split(",")
  end

  SCORING_FIELD_TYPES = ["text", "number", "boolean", "boolean_set", "radio_set", "range"]
end
