class CreateCidades < ActiveRecord::Migration[6.1]
  def change
    create_table :cidades do |t|
      t.string :cidade, null: false
      t.string :uf, null: false

      t.timestamps
      t.index :cidade
    end
  end
end
