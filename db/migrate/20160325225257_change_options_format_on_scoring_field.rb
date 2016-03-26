class ChangeOptionsFormatOnScoringField < ActiveRecord::Migration
  def change
    # PostgreSQL needs a specific syntax for converting between column types
    change_column :scoring_fields, :options, 'text[] USING CAST(options AS text[])'
  end
end
