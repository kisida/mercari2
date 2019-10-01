class MainsController < ApplicationController

  def index
    @items = Item.includes(:item_images)
  end

end
