json.array!(@customers) do |customer|
  json.extract! customer, :id, :id, :first_nm, :last_nm
  json.url customer_url(customer, format: :json)
end
