class ClientesIndexUniqueness < ActiveRecord::Migration[6.1]
  def change
    remove_index :clientes, name: "index_clientes_on_cliente_index"
    add_index :clientes, :cliente_index, unique: true
  end
end
