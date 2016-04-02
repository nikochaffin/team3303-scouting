class ChangeOptionsFormatOnScoringField < ActiveRecord::Migration
  def change
    # PostgreSQL needs a specific syntax for converting between column types
    change_column :scoring_fields, :options, :text, array: true
  end
end
