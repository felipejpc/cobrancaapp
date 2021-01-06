class Pagamento < ApplicationRecord
  belongs_to :venda
  validates :parcela, :dt_venc, :valor,  presence: true
end
