class ScoringEntry < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
  serialize :properties, Hash
  validates :team_number, presence: true
  validates :match_number, presence: true

  def name_property
    properties.keys.each do |key|
      if key.include? 'name'
        if !properties[key].empty? then return properties[key] end
      end
    end
    nil
  end

  def name_or_username
    name || name_property || self.user.username
  end

  def properties_for_csv
    game.fields.map do |field|
      if field.field_type == "checkbox_set"
        field.options.map do |option|
          if !properties[field.name].nil?
            properties[field.name][option]
          else
            nil
          end
        end
      else
        properties[field.name]
      end
    end.flatten.unshift name_or_username, match_number, team_number
  end
end
