class Pagamento < ApplicationRecord
  belongs_to :venda
  validates :parcela, :dt_venc, :valor, presence: true
  scope :em_aberto, -> { where(dt_pgto: nil) }
end
