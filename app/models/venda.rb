class Venda < ApplicationRecord
  belongs_to :cliente
  has_many :pagamentos, dependent: :destroy
  validates :mercadorias, :valor, :data, presence: true

  def self.gerar(venda, forma_pgto)
    gera_pgtos(venda, forma_pgto) if venda.save
  end

  def self.gera_pgtos(venda, forma_pgto)
    if forma_pgto == 1
      venda.pagamentos.create(parcela: 1, dt_venc: venda.data, valor: venda.valor, dt_pgto: venda.data)
    else
      forma_pgto.times do |x|
        if x > 0
          venda.pagamentos.create(parcela: x, dt_venc: venda.data + x.month, valor: (venda.valor)/(forma_pgto - 1))
        end
      end
    end
  end
end
