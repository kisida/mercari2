class MainsController < ApplicationController

  def index
    @items = Item.all
  end

end
