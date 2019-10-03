class MainsController < ApplicationController

  def index
    @ladys = Item.where(category_id:1...89).order("id DESC").limit(10)
    @mens = Item.where(category_id:90...194).order("id DESC").limit(10)
  end

end
