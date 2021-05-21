require 'rails_helper'

RSpec.describe PurchaseHistoryAddress, type: :model do
  describe '商品購入情報の保存' do
  before do
  user = FactoryBot.create(:user)
  item = FactoryBot.create(:item)
  @purchase_history_address = FactoryBot.build(:purchase_history_address, user_id: user.id, item_id: item.id)
  sleep 0.1
  end
 context '商品購入がうまくいく時' do
  it '全ての値が正しく入力されていれば購入できること' do
    expect(@purchase_history_address).to be_valid
  end
 end

 context '商品購入がうまくいかない時' do
  it '郵便番号が空だと保存できない' do
    @purchase_history_address.postal_code = ''
    @purchase_history_address.valid?
    expect(@purchase_history_address.errors.full_messages).to include("Postal code can't be blank")
  end
  it '郵便番号は、数字だけだと保存できない' do
    @purchase_history_address.postal_code = '1234567'
    @purchase_history_address.valid?
    expect(@purchase_history_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
  end
  it '郵便番号は、文字だと保存できない' do
    @purchase_history_address.postal_code = 'aaa-aaaa'
    @purchase_history_address.valid?
    expect(@purchase_history_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
  end
  it '郵便番号は、ハイフンの位置が正しくないと保存できない' do
    @purchase_history_address.postal_code = '12-34567'
    @purchase_history_address.valid?
    expect(@purchase_history_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
  end
  it '都道府県の情報が必須である' do
    @purchase_history_address.prefecture_id = 1
    @purchase_history_address.valid?
    expect(@purchase_history_address.errors.full_messages).to include("Prefecture must be other than 1")
  end
  it '市区町村の情報が必須である' do
    @purchase_history_address.city = ''
    @purchase_history_address.valid?
    expect(@purchase_history_address.errors.full_messages).to include("City can't be blank")

  end
  it '番地の情報が必須である' do
    @purchase_history_address.address = ''
    @purchase_history_address.valid?
    expect(@purchase_history_address.errors.full_messages).to include("Address can't be blank")
  end
  it '電話番号が必須である' do
    @purchase_history_address.phone_number = ''
    @purchase_history_address.valid?
    expect(@purchase_history_address.errors.full_messages).to include("Phone number can't be blank")
  end
  it '電話番号は11桁以内の数値のみ保存ができる' do
    @purchase_history_address.phone_number = 'aaaaaaaaaaa'
    @purchase_history_address.valid?
    expect(@purchase_history_address.errors.full_messages).to include("Phone number is not a number")
  end
  it '電話番号は11桁以上は保存できない' do
    @purchase_history_address.phone_number = '090123456789'
    @purchase_history_address.valid?
    expect(@purchase_history_address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
  end
  it "tokenが空では登録できないこと" do
    @purchase_history_address.token = nil
    @purchase_history_address.valid?
    expect(@purchase_history_address.errors.full_messages).to include("Token can't be blank")
  end
  



 


   end
  end
end

