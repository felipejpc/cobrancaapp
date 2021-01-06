class Cidade < ApplicationRecord
  has_many :clientes
  validates :cidade, :uf, presence: true
end
