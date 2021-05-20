class PurchaseHistoriesController < ApplicationController
  def index
    # PurchaseHistoryAddressのインスタンス生成
    @purchase_history_address = PurchaseHistoryAddress.new
    @item = Item.find(params[:item_id])
    # +α商品情報を持ったインスタンスを作成

    # => purchase_histories/index.html.erbを編集する。
    # createにbinding.pryを入れてターミナルにparamsと入力。paramsの中に必要なデータが入っていればOK
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_history_address = PurchaseHistoryAddress.new(purchase_history_params)
    if @purchase_history_address.valid?
      @purchase_history_address.save
      redirect_to root_path
      else
        render :index
      end
      
  end


 private
 def purchase_history_params
  params.require(:purchase_history_address).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
 end
  
end


