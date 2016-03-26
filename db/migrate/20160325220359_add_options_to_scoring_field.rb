class AddOptionsToScoringField < ActiveRecord::Migration
  def change
    add_column :scoring_fields, :options, :text
    add_column :scoring_fields, :range_min, :number
    add_column :scoring_fields, :range_max, :number
  end
end
