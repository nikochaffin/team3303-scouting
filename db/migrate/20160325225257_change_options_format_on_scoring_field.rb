class ChangeOptionsFormatOnScoringField < ActiveRecord::Migration
  def change
    add_column :scoring_fields, :options, :text, array: true, default: []
  end
end
