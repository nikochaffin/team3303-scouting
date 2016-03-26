class ChangeOptionsFormatOnScoringField < ActiveRecord::Migration
  def change
    change_column :scoring_fields, :options, :text, array: true, default: []
  end
end
