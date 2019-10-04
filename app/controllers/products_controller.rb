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
    @item.item_images.build
  end

  # カテゴリー習得メソッド
  def get_children
    @child_category = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_grand_children
    @grand_child = Category.find("#{params[:child_id]}").children
  end

# 商品出品機能（野口
  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      redirect_back(fallback_location: new_product_path)
    end
    
  end


# 商品詳細編集 (野口)
  def edit
    @item = Item.find(params[:id])
    @categories = []

    Category.where(ancestry: nil).each do |parent|
      @categories << parent.name
    end
  end

# 商品詳細編集 (野口)
  def update
    @item = Item.find(params[:id])

    if  @item.update(item_params) && @item.seller_id == current_user.id
      redirect_to root_path
    else
      redirect_back(fallback_location: edit_product_path)
    end
  end


# 画像非同期の削除機能
  def image_easy
    @image = ItemImage.find(params[:id])
    @image.destroy
    @item = @image.item_id
    @item = Item.find(@item)
  end

# 未使用
  def destroy
  end


  private
  def item_params
    params.require(:item).permit(:category_id ,:name, :gender, :brand, :size, :condition, :postage, :shipping, :area, :day_before_shippment, :price, :text, :status, item_images_attributes: [:image]).merge(seller_id: current_user.id, category_id: params[:category_id])
  end
  
end

