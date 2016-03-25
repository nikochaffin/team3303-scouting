class Game < ActiveRecord::Base
  has_many :fields, class_name: "ScoringField", foreign_key: "game_id"
  accepts_nested_attributes_for :fields, allow_destroy: true
end
