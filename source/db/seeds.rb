# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Seed 4 Customers into the system:
Customer.create([
	{first_nm: 'Johnny', last_nm: 'Flow'},
	{first_nm: 'Raj', last_nm: 'Jamnis'},
	{first_nm: 'Andrew', last_nm: 'Chung'},
	{first_nm: 'Mike', last_nm: 'Smith'},
])


# Seed 20 transactions (charges) into the system:
def create_charge(customer_id, paid, disputed)
	CreditCharge.create(
		paid: paid,
		created: Time.now,
		amount: (1000..20000).to_a.sample,
		currency: 'usd',
		refunded: disputed,
		customer_id: customer_id
	)
end

# 10 Should be successful transactions:
#   - 5 Should be linked to Customer 1
5.times do
	create_charge(1, true, false)
end
#   - 3 Should be linked to Customer 2
3.times do
	create_charge(2, true, false)
end
#   - 1 Should be linked to Customer 3
create_charge(3, true, false)
#   - 1 Should be linked to Customer 4
create_charge(4, true, false)


# 5 Should be transactions that failed:
#   - 3 Should be linked to Customer 3
3.times do
	create_charge(3, false, false)
end
#   - 2 Should be linked to Customer 4
2.times do
	create_charge(4, false, false)
end


# zahmad: ASSUME DISPUTED MEANS PAID + REFUNDED
# 5 should be disputed:
#   - 3 should be linked to Customer 1
3.times do
	create_charge(1, true, true)
end
#   - 2 should be linked to customer 2
2.times do
	create_charge(1, true, true)
end
