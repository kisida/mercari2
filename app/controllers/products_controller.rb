class ProductsController < ApplicationController
  before_action :authenticate_user!, expect: :update


#未使用
  def index
  end

# 商品詳細画面（関口）
  def show
  @item=Item.find(params[:id])
  @seller=@item.seller
  @grand_child_id = Category.find(@item.category_id)
  @child_id = @grand_child_id.parent
  @category_id = @child_id.parent
  @category_parents = Category.where(ancestry: nil)
  @images=@item.item_images

  end
# 商品出品画面（野口)
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

# 商品購入画面（野口）※必須
  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      redirect_back(fallback_location: new_product_path)
    end
    
  end

def destroy
  @item =Item.find(params[:id])
    if  @item.seller_id == current_user.id
        @item.destroy
        redirect_to root_path
    else
      redirect_to new_product_path
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


# 商品削除 ※必須

#商品購入確認画面
  def buy_edit
    @item = Item.find(params[:id])
    @seller=@item.seller
    @addresses = @seller.addresses
  end

  require 'payjp'

  #商品購入後にPay.jpにデータ飛ばす専用アクション（不可侵）====
  #商品購入完了画面
  def pay
    @item = Item.find(params[:id])
    Payjp.api_key = "sk_test_cfd505a323b7a500937468a7"
    Payjp::Charge.create(
      amount: @item.price, # 決済する値段。ここをテーブルから拾う。
      card: params['payjp-token'], # フォームを送信すると作成・送信されてくるトークン
      currency: 'jpy'
    )
    if @item.update(status: 3, buyer_id: current_user.id)
      flash[:notice] = '購入しました。'
      redirect_to root_path
    else
      flash[:alert] = '購入に失敗しました。'
      redirect_to buy_edit_products_path
    end
    
    
  end
  #====================================================
  private


  def item_params
    params.require(:item).permit(:category_id ,:name, :gender, :brand, :size, :condition, :postage, :shipping, :area, :day_before_shippment, :price, :text, :status, item_images_attributes: [:id, :image]).merge(seller_id: current_user.id, category_id: params[:category_id])
  end
  
end

