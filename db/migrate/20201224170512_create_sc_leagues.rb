class CreateScLeagues < ActiveRecord::Migration[6.1]
  def change
    create_table :sc_leagues do |t|
      t.string :name
      t.text :description
      t.integer :players
      t.date :date

      t.timestamps
    end
  end
end
