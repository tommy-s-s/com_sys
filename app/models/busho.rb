class Busho < ApplicationRecord
    has_many :users, through: :user_bushos
    has_many :user_bushos
end
