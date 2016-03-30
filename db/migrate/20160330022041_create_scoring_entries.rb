class CreateScoringEntries < ActiveRecord::Migration
  def change
    create_table :scoring_entries do |t|
      t.integer :user_id
      t.integer :game_id
      t.integer :team_number
      t.text :properties
      t.text :notes

      t.timestamps null: false
    end
  end
end
