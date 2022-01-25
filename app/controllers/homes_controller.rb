class HomesController < ApplicationController

  def top
    @items = Item.all
    p @items
  end

  def about
  end
end
