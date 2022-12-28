class Busho < ApplicationRecord
    #各モデル相互登録するために追加↓
    has_many :users, through: :user_bushos
    has_many :user_bushos
end
