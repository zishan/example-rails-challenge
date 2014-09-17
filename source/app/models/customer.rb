class Customer < ActiveRecord::Base
	has_many :credit_charges

	def name
		"#{first_nm} #{last_nm}"
	end
end
