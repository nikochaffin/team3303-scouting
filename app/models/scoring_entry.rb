class ScoringEntry < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
  serialize :properties, Hash
  validates :team_number, presence: true
  validates :match_number, presence: true

  def properties_for_csv
    game.fields.map do |field|
      if field.field_type == "checkbox_set"
        field.options.map do |option|
          if !properties[field.name].nil?
            if properties[field.name][option] == "1" then "Yes" else "No" end
          else
            nil
          end
        end
      else
        properties[field.name]
      end
    end.flatten.unshift match_number, team_number
  end
end
