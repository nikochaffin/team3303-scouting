class AddColumnMatchNumberToScoringEntry < ActiveRecord::Migration
  def change
    add_column :scoring_entries, :match_number, :integer
  end
end
