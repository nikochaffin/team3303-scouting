class ChangeOptionsFormatOnScoringField < ActiveRecord::Migration
  def change
    change_column :scoring_fields, :options, 'text[] USING CAST(options AS text[])'
  end
end
