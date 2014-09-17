class CreditCharge < ActiveRecord::Base
	belongs_to :customer

    # zahmad: ASSUME FAILED MEANS NOT PAID
	scope :failed_charges, -> { where(paid: false) }

    # zahmad: ASSUME DISPUTED MEANS PAID AND REFUNDED
	scope :disputed_charges, -> { where(paid: true, refunded: true) }

    # zahmad: ASSUME SUCCESSFUL MEANS PAID AND NOT REFUNDED
	scope :successful_charges, -> { where(paid: true, refunded: false) }
end
