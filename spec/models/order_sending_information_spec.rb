require 'rails_helper'

RSpec.describe OrderSendingInformation, type: :model do
  describe '商品購入' do
    before do
      #user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_sending_information = FactoryBot.build(:order_sending_information, item_id: item.id)
      #@order_sending_information = FactoryBot.build(:order_sending_information, user_id: user.id, item_id: item.id)
    end
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_sending_information).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_sending_information.building = ''
        expect(@order_sending_information).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @order_sending_information.postal_code = ''
        @order_sending_information.valid?
        expect(@order_sending_information.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      end
      it 'prefectureを選択していないと保存できないこと' do
        @order_sending_information.prefecture_id = '1'
        @order_sending_information.valid?
        expect(@order_sending_information.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @order_sending_information.city = ''
        @order_sending_information.valid?
        expect(@order_sending_information.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @order_sending_information.address = ''
        @order_sending_information.valid?
        expect(@order_sending_information.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @order_sending_information.phone_number = ''
        @order_sending_information.valid?
        expect(@order_sending_information.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが10桁以上11桁以内でないと保存できないこと' do
        @order_sending_information.phone_number = '123456789012'
        @order_sending_information.valid?
        expect(@order_sending_information.errors.full_messages).to include('Phone number is invalid.')
      end
      it 'phone_numberが半角数値のみでないと保存できないこと' do
        @order_sending_information.phone_number = '１２３４５'
        @order_sending_information.valid?
        expect(@order_sending_information.errors.full_messages).to include('Phone number is invalid.')
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_sending_information.user_id = nil
        @order_sending_information.valid?
        expect(@order_sending_information.errors.full_messages).to include()
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_sending_information.item_id = nil
        @order_sending_information.valid?
        expect(@order_sending_information.errors.full_messages).to include()
      end
      it "tokenが空では登録できないこと" do
        @order_sending_information.token = nil
        @order_sending_information.valid?
        expect(@order_sending_information.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
