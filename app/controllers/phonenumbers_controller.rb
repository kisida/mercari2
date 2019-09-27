class PhonenumbersController < ApplicationController

  def new
    @phone_number = Phonenumber.new
  end

  def create
    @phone_number = Phonenumber.create(create_params)
    if @phone_number.save
      redirect_to '/addresses/new'
    else
      redirect_back(fallback_location: new_phonenumber_path)
    end
  end


private

  def create_params
    params.require(:phonenumber).permit(:phone_number).merge(user_id: current_user.id)
  end

end
