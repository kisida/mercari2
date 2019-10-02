class MainsController < ApplicationController

  def index
    # @items = Item.where(category_id:1...89).order("id DESC").limit(10)
    # @items = Item.all.order("id DESC").limit(10)

    @ladys = Item.where(category_id:1...89).order("id DESC").limit(10)
    @mens = Item.where(category_id:90...194).order("id DESC").limit(10)
    
  end

end
