class AddCidadesRefToClientes < ActiveRecord::Migration[6.1]
  def change
    add_reference :clientes, :cidade, null: false, foreign_key: true
  end
end
