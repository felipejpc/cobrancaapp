class CreateClientes < ActiveRecord::Migration[6.1]
  def change
    create_table :clientes do |t|
      t.string :nome, null: false
      t.string :endereco
      t.string :cliente_index, null: false

      t.timestamps
      t.index :nome
      t.index :cliente_index
    end
  end
end
