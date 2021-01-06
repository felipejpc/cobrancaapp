class CreateVendas < ActiveRecord::Migration[6.1]
  def change
    create_table :vendas do |t|
      t.references :cliente, null: false, foreign_key: true
      t.text :mercadorias
      t.decimal :valor, precision: 8, scale: 2
      t.date :data
      t.string :obs

      t.timestamps
      t.index :data
    end
  end
end
