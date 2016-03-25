class CreateScoringFields < ActiveRecord::Migration
  def change
    create_table :scoring_fields do |t|
      t.string :name
      t.string :field_type
      t.integer :game_id

      t.timestamps null: false
    end
  end
end
