class AddressesController < ApplicationController

  def new
    @address = Address.new
  end

  def create
    @address = Address.create(create_params)
    if @address.save
      redirect_to '/signup/credit'
    else
      redirect_to 'root_path'
    end
  end


private

  def create_params
    params.require(:address).permit(:area_number, :prefecture, :municipalities, :address_number, :building, :tel_number).merge(user_id: current_user.id)
  end
end
