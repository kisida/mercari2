class MainsController < ApplicationController

  def index
    @items = Item.all.order("id DESC").limit(10)
  end

end
