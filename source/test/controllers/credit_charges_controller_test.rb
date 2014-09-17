require 'test_helper'

class CreditChargesControllerTest < ActionController::TestCase
	setup do
		@credit_charge = credit_charges(:one)
	end

	test "should get index" do
		get :index
		assert_response :success
		assert_equal assigns(:failed_charges), CreditCharge.where(paid: false)
		assert_equal assigns(:disputed_charges), CreditCharge.where(paid: true, refunded: true)
		assert_equal assigns(:successful_charges), CreditCharge.where(paid: true, refunded: false)

		# Verify that there are three lists on the screen
		assert_select 'table.charges', 3
		assert_select 'table.successful_charges', 1
		assert_select 'table.failed_charges', 1
		assert_select 'table.disputed_charges', 1

		# Verify that in the Successful charges list there are 10 line items
		assert_select 'tr.successful_charges', 10

		# Verify that in the failed charges list there are 5 failed charges
		assert_select 'tr.failed_charges', 5

		# Verify that in the disputed charges list there are 5 disputed charges
		assert_select 'tr.disputed_charges', 5
	end

	test "should get new" do
		get :new
		assert_response :success
	end

	test "should create credit_charge" do
		assert_difference('CreditCharge.count') do
			post :create, credit_charge: { amount: @credit_charge.amount, created: @credit_charge.created, currency: @credit_charge.currency, customer_id: @credit_charge.customer_id, paid: @credit_charge.paid, refunded: @credit_charge.refunded }
		end

		assert_redirected_to credit_charge_path(assigns(:credit_charge))
	end

	test "should show credit_charge" do
		get :show, id: @credit_charge
		assert_response :success
	end

	test "should get edit" do
		get :edit, id: @credit_charge
		assert_response :success
	end

	test "should update credit_charge" do
		patch :update, id: @credit_charge, credit_charge: { amount: @credit_charge.amount, created: @credit_charge.created, currency: @credit_charge.currency, customer_id: @credit_charge.customer_id, id: @credit_charge.id, paid: @credit_charge.paid, refunded: @credit_charge.refunded }
		assert_redirected_to credit_charge_path(assigns(:credit_charge))
	end

	test "should destroy credit_charge" do
		assert_difference('CreditCharge.count', -1) do
			delete :destroy, id: @credit_charge
		end

		assert_redirected_to credit_charges_path
	end
end
