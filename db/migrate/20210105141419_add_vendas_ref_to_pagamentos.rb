class AddVendasRefToPagamentos < ActiveRecord::Migration[6.1]
  def change
    add_reference :pagamentos, :venda, null: false, foreign_key: true
  end
end
