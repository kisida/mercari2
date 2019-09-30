class ProductsController < ApplicationController

#未使用
  def index
  end
# 商品詳細画面（関口）
  def show
  end
# 商品出品画面（野口
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
# 商品購入確認画面（野口
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    end
    
  end
# 未使用
  def edit
  end
# 未使用
  def update
  end
# 未使用
  def destroy
  end


  private
  def item_params
    params.require(:item).permit(:name, :gender, :brand, :size, :condition, :postage, :shipping, :area, :day_before_shippment, :price, :text, :status, seller_id: current_user.id)
  end
end

