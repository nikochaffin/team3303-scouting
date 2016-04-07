class AddColumnNameToScoringEntry < ActiveRecord::Migration
  def change
    add_column :scoring_entries, :name, :string
  end
end
