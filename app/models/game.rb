class Game < ActiveRecord::Base
  has_many :fields, class_name: "ScoringField", foreign_key: "game_id"
  has_many :entries, class_name: "ScoringEntry", foreign_key: "game_id"
  accepts_nested_attributes_for :fields, allow_destroy: true

  def entries
    ScoringEntry.where(game_id: self.id).order(created_at: :asc)
  end

  def has_checkbox_set?
    entries.where(field_type: "checkbox_set").count > 0
  end

  def field_names
    fields.map { |field| field.name }
  end

  def fields_for_csv
    fields.map do |field|
      if field.field_type == "checkbox_set"
        field.options.map { |option| field.name.humanize + " / " + option }
      else
        field.name.humanize
      end
    end.flatten.unshift "Name", "Match Number", "Team Number"
  end

  def entries_to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << fields_for_csv
      entries.each do |entry|
        csv << entry.properties_for_csv
      end
    end
  end

  def team_numbers
    @entries = ScoringEntry.where(game_id: id).select(:team_number).map { |entry| entry.team_number }.uniq
  end
end
