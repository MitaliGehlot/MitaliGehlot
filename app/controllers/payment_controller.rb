class PaymentController < ApplicationController
  def index
   @payment = Payment.all
  end
  def show
   @payment = Payment.find(params[:id]) 
  end
 

  def create
    @payment = Payment.new(payment_type: "...", amount: "...")

    if @payment.save
      redirect_to @payment
    else
      render :new
    end
  end

   def edit
    @payment = Payment.find(params[:id])
  end

  def update
    @payment = Payment.find(params[:id])

    if @payment.update(payment_params)
      redirect_to @payment
    else
      render :edit
    end
 end
    private
    def payment_params
      params.require(:payment).permit(:payment_type, :amount)
    end
end

