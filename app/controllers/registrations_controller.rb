class RegistrationsController < Devise::RegistrationsController
  

  def create
    # add custom create logic here
  end

  def update
    super
    @user.update(role: params[:user][:role].to_i)
  end
end