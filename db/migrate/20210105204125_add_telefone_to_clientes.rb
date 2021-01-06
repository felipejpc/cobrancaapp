class AddTelefoneToClientes < ActiveRecord::Migration[6.1]
  def change
    add_column :clientes, :fone_fixo, :string
    add_column :clientes, :fone_celular, :string
  end
end
