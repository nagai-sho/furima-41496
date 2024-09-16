require 'rails-helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    @order_address = FactoryBot.build(:order_address, user_id: user.id)
  end

  describe '注文情報の保存' do
    context '注文情報の保存ができる' do
      it '全ての項目が入力されていれば保存ができる' do
      end
      it 'buildingは空でも保存ができる' do
      end
    end
    context '注文情報の保存ができない' do
      it '' do
      end
    end
  end
end
