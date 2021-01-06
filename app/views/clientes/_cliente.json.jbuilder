json.extract! cliente, :id, :nome, :endereco, :cliente_index, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
