class AddOptionsToScoringField < ActiveRecord::Migration
  def change
    add_column :scoring_fields, :options, :string, array: true
    add_column :scoring_fields, :range_min, :integer
    add_column :scoring_fields, :range_max, :integer
  end
end
