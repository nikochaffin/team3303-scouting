class ScoringEntry < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
  serialize :properties, Hash
  validates :team_number, presence: true
  validates :match_number, presence: true
end
