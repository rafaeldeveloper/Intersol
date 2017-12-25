json.extract! transaction, :id, :conta_id, :valor, :tipo, :usuario_id, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
