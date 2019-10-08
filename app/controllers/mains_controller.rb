class MainsController < ApplicationController

  def index

    @items = Item.all.order("id DESC").limit(10)
    @q = Item.ransack(params[:q])
    @item = @q.result(distinct: true)


    @category_parents = Category.where(ancestry: nil)

    @ladys = Item.where(category_id:1...89).order("id DESC").limit(10)
    @mens = Item.where(category_id:90...194).order("id DESC").limit(10)

  end

  def category_children
    @children = Category.find(params[:parent_id]).children
  end

  def category_grandchildren
    @grandchildren = Category.find("#{params[:parent_id]}").children
  end


  def search
    @search = Item.ransack(search_params)
    @search2 = Category.ransack(search_params)
    @results = @search.result(distinct: true)
    conditon = Item.conditions.keys
  end

  private
  def search_params
    params.require(:q).permit!
  end
  
end
