class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :position
      t.integer :number
      t.references :team, index: true
    end
  end
end
