class PagamentosController < ApplicationController
  before_action :set_cliente_venda, only: %i[new create edit update destroy]
  before_action :set_pagamento, only: %i[edit update destroy]

  # GET /vendas/new
  def new
    @pagamento = @venda.pagamentos.build
  end

  # GET /vendas/1/edit
  def edit
  end

  # POST /vendas
  # POST /vendas.json
  def create
    @pagamento = @venda.pagamentos.build(pagamento_params)

    respond_to do |format|
      if @pagamento.save
        format.html { redirect_to cliente_venda_path(@cliente, @venda), notice: 'O pagamento foi registrada!' }
        format.json { render :show, status: :created, location: @pagamento }
      else
        format.html { render :new }
        format.json { render json: @pagamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vendas/1
  # PATCH/PUT /vendas/1.json
  def update
    respond_to do |format|
      if @pagamento.update(pagamento_params)
        format.html { redirect_to cliente_venda_path(@cliente, @venda), notice: 'Os dados do Pagamento foram atualizados!' }
        format.json { render :show, status: :ok, location: @pagamento }
      else
        format.html { render :edit }
        format.json { render json: @pagamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendas/1
  # DELETE /vendas/1.json
  def destroy
    @pagamento.destroy
    respond_to do |format|
      format.html { redirect_to cliente_venda_path(@cliente, @venda), notice: 'O pagamento foi excluído!' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cliente_venda
    @cliente = Cliente.find(params[:cliente_id])
    @venda = @cliente.vendas.find(params[:venda_id])
  end

  def set_pagamento
    @pagamento = @venda.pagamentos.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def pagamento_params
    params.require(:pagamento).permit(:parcela, :dt_venc, :valor, :dt_pgto)
  end
end
