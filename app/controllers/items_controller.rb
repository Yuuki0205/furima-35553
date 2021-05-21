class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
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
    redirect_to root_path if current_user.id == @item.user_id && @item.purchase_history.present?
    # editとupdateのunless文は復習のため置いておきます
    # unless @item.user_id == current_user.id
    #   redirect_to action: :index
    #  end
  end

  def update
    # 検証ツールを用いた不正なアクセスを防ぐ目的があります！
    # unless @item.user_id == current_user.id
    #   redirect_to action: :index
    #  end

    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @item.destroy
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :product_description, :product_category_id, :product_condition_id,
                                 :shipping_charge_id, :prefecture_id, :days_ship_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless @item.user_id == current_user.id
    # unless文と同じ意味 復習のため残しておきます。
    # if current_user.id == @item.user_id
    #   if @item.purchase_history.present?
    #     redirect_to root_path
    #   end
    #   end
  end
end
