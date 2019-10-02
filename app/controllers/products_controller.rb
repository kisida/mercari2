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
    @item.item_images.new
  end

  # カテゴリー習得メソッド
  def get_children
    @child_category = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_grand_children
    @grand_child = Category.find("#{params[:child_id]}").children
  end

# 商品購入画面（野口）※必須
  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      redirect_to new_product_path
    end
    
  end


# 商品詳細編集 (野口)
  def edit
    @item = Item.find(params[:id])
    # @images = Item_image.where(item_id: @item.id)
  end

# 商品詳細編集 (野口)
  def update
    @item = Item.find(params[:id])
    
    if item.seller_id == current_user.id
      item.update(item_params)
    end
  end


# 未使用（商品削除）※必須
  def destroy
  end


  private
  def item_params
    params.require(:item).permit(:category_id ,:name, :gender, :brand, :size, :condition, :postage, :shipping, :area, :day_before_shippment, :price, :text, :status, item_images_attributes: [:image]).merge(seller_id: current_user.id, category_id: params[:category_id])
  end

end

