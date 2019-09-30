class ProductsController < ApplicationController

  def index
  end

  def show
    
  end

  def new
    @categories = []

    Category.where(ancestry: nil).each do |parent|
      @categories << parent.name
    end

    @item = Item.new
  end

  def get_children
    @child_category = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_grand_children
    @grand_child = Category.find("#{params[:child_id]}").children
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    end
    
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def item_params
    params.require(:item).permit(:name, :gender, :brand, :size, :condition, :postage, :shipping, :area, :day_before_shippment, :price, :text, :status, seller_id: current_user.id)
  end
end