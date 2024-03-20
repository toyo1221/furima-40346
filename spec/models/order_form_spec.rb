require 'rails_helper'

RSpec.describe OrderForm, type: :model do
    before do
      @order_form = FactoryBot.build(:order_form)
    end

  describe '商品購入機能' do
    context '商品を購入できるとき' do
      it '全ての値が適切に入力されていれば保存できること' do
        expect(@order_form).to be_valid
      end

      it '建物名は空でも保存ができること' do
        @order_form.building_name = ''
        expect(@order_form).to be_valid
      end
  end

    context '商品を購入できないとき' do
      it "tokenが空では登録できないこと" do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が空では保存できないこと' do
        @order_form.post_code = ''
        expect(@order_form).not_to be_valid
      end

      it '郵便番号は、「3桁ハイフン4桁」の半角文字列でないと保存ができないこと' do
        @order_form.post_code = '123456'
        expect(@order_form).not_to be_valid
      end

      it '都道府県が --- では保存ができないこと' do
        @order_form.prefecture_id = 0
        expect(@order_form).not_to be_valid
      end

      it '市区町村が空では保存ができないこと' do
        @order_form.municipalities = ''
        expect(@order_form).not_to be_valid
      end

      it '番地が空では保存ができないこと' do
        @order_form.street_address = ''
        expect(@order_form).not_to be_valid
      end

      it '電話番号が空では保存ができないこと' do
        @order_form.telephone_number = ''
        expect(@order_form).not_to be_valid
      end

      it '電話番号は、10桁より少ないと保存できないこと' do
        @order_form.telephone_number = '123456789' 
        expect(@order_form).not_to be_valid
      end
      
      it '電話番号は、11桁より大きいと保存できないこと' do
        @order_form.telephone_number = '123456789012' #
        expect(@order_form).not_to be_valid
      end
    end
  end
end