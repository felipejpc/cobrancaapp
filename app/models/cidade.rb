class Cidade < ApplicationRecord
  has_many :clientes
  validates :nome, :uf, presence: true
end
