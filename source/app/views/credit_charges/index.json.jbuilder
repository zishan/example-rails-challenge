json.array!(@credit_charges) do |credit_charge|
  json.extract! credit_charge, :id, :id, :created, :paid, :amount, :currency, :refunded, :customer_id
  json.url credit_charge_url(credit_charge, format: :json)
end
