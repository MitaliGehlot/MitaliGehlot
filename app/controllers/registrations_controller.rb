class RegistrationsController < Devise::RegistrationsController
  

  def create
    super
    @user.update(role: params[:user][:role].to_i)
  end

  def update
    super
    @user.update(role: params[:user][:role].to_i)
  end
end