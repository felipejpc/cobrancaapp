class RelatoriosController < ApplicationController
  def index
    @total_a_receber = Pagamento.em_aberto.sum("valor")
    @ultimos_recebimentos = {}
  end
end
