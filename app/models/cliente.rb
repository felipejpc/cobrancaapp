class Cliente < ApplicationRecord
  belongs_to :cidade
  has_many :vendas, dependent: :destroy
  validates :nome, :cliente_index, presence: true
  validates :cliente_index, uniqueness: true

  def cria_cliente_index
    self.cliente_index = "#{nome} (#{Cidade.find_by(id: cidade_id).cidade})"
  end
end
