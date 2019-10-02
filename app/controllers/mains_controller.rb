class MainsController < ApplicationController

  def index
    @items = Item.all.order("id DESC").limit(10)
    @q = Item.ransack(params[:q])
    @item = @q.result(distinct: true)
  end

  def search
    @search = Item.ransack(search_params)
    @results = @search.result(distinct: true)
  end

  private
  def search_params
    params.require(:q).permit!
  end
  

end
