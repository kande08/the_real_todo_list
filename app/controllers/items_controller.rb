class ItemsController < ApplicationController
  def show
    @items = Item.find(params[:id])
  end

  def new
    # @list = List.find(params[:id])
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    # @list = List.find(params[:id])
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    if item.destroy
      redirect_to root_path
    else
      redirect_to item_path(item)
    end
  end

  private
    def item_params
      params.require(:item).permit(:name, :description, :priority, :completed, :list_id)
    end
end
