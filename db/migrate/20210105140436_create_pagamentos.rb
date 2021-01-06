class CreatePagamentos < ActiveRecord::Migration[6.1]
  def change
    create_table :pagamentos do |t|
      t.integer :parcela
      t.date :dt_venc
      t.decimal :valor, precision: 8, scale: 2
      t.date :dt_pgto

      t.timestamps
      t.index :dt_venc
      t.index :dt_pgto
    end
  end
end
