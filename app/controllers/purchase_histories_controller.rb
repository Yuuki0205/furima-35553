class PurchaseHistoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    
    @purchase_history_address = PurchaseHistoryAddress.new
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id || @item.purchase_history.present?
      redirect_to root_path
    end
    


   
  end

  def create
    
    @item = Item.find(params[:item_id])
    @purchase_history_address = PurchaseHistoryAddress.new(purchase_history_params)
    if @purchase_history_address.valid?
      pay_item
      @purchase_history_address.save
      redirect_to root_path
      else
        render :index
      end
      
  end


 private
 def purchase_history_params
  params.require(:purchase_history_address).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
 end

 def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
  Payjp::Charge.create(
    amount: @item[:price],  
    card: purchase_history_params[:token],    
    currency: 'jpy'                 
  )
end
  
end


