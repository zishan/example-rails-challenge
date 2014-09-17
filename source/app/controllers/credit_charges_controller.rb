class CreditChargesController < ApplicationController
  before_action :set_credit_charge, only: [:show, :edit, :update, :destroy]

  # GET /credit_charges
  # GET /credit_charges.json
  def index
    # zahmad: ASSUME FAILED MEANS NOT PAID
    @failed_charges = CreditCharge.where(paid: false)
    # zahmad: ASSUME DISPUTED MEANS PAID AND REFUNDED
    @disputed_charges = CreditCharge.where(paid: true, refunded: true)
    # zahmad: ASSUME SUCCESSFUL MEANS PAID AND NOT REFUNDED
    @successful_charges = CreditCharge.where(paid: true, refunded: false)
  end

  # GET /credit_charges/1
  # GET /credit_charges/1.json
  def show
  end

  # GET /credit_charges/new
  def new
    @credit_charge = CreditCharge.new
  end

  # GET /credit_charges/1/edit
  def edit
  end

  # POST /credit_charges
  # POST /credit_charges.json
  def create
    @credit_charge = CreditCharge.new(credit_charge_params)

    respond_to do |format|
      if @credit_charge.save
        format.html { redirect_to @credit_charge, notice: 'Credit charge was successfully created.' }
        format.json { render action: 'show', status: :created, location: @credit_charge }
      else
        format.html { render action: 'new' }
        format.json { render json: @credit_charge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /credit_charges/1
  # PATCH/PUT /credit_charges/1.json
  def update
    respond_to do |format|
      if @credit_charge.update(credit_charge_params)
        format.html { redirect_to @credit_charge, notice: 'Credit charge was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @credit_charge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /credit_charges/1
  # DELETE /credit_charges/1.json
  def destroy
    @credit_charge.destroy
    respond_to do |format|
      format.html { redirect_to credit_charges_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_credit_charge
      @credit_charge = CreditCharge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def credit_charge_params
      params.require(:credit_charge).permit(:id, :created, :paid, :amount, :currency, :refunded, :customer_id)
    end
end
