class FixCidadeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :cidades, :cidade, :nome
  end
end
