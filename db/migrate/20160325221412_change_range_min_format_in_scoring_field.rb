class ChangeRangeMinFormatInScoringField < ActiveRecord::Migration
  def up
    change_column :scoring_fields, :range_min, :integer
    change_column :scoring_fields, :range_max, :integer
  end

  def down
    change_column :scoring_fields, :range_min, :integer
    change_column :scoring_fields, :range_max, :integer
  end
end
