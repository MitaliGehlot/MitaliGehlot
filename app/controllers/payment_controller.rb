class PaymentController < ApplicationController
  def index
    @payment = Payment.all
  end

  def show
    @payment = Payment.find(params[:id])
  end

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(amount: "...", Payment_type: "...")

    if @payment.save
      redirect_to @payment
    else
      render :new
    end
  end

  private
    def payment_params
      params.require(:payment).permit(:amount, :Payment_type)
    end
end
