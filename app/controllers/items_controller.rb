class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  before_action :find_item, only: [:show, :edit, :update, :destroy]
  before_action :set_item, only: [:edit, :destroy]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
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

  def show
  end

  def edit
    if @item.order.nil?
    else
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(item_params)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :description, :category_id, :condition_id, :postage_payer_id, :prefecture_id, :preparation_day_id, :price).merge(user_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end

  def set_item
    unless @item.user_id == current_user.id
      redirect_to root_path
    end
  end

end
