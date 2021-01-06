class VendasController < ApplicationController
  before_action :get_cliente
  before_action :set_venda, only: [:show, :edit, :update, :destroy]
  before_action :set_pagamentos, only: :show

  # GET /vendas
  # GET /vendas.json
  def index
    @vendas = @cliente.vendas.order(data: :desc)
  end

  # GET /vendas/1
  # GET /vendas/1.json
  def show
  end

  # GET /vendas/new
  def new
    @venda = @cliente.vendas.build
  end

  # GET /vendas/1/edit
  def edit
  end

  # POST /vendas
  # POST /vendas.json
  def create
    @venda = @cliente.vendas.build(venda_params)

    respond_to do |format|
      if Venda.gerar(@venda, forma_pgto)
        format.html { redirect_to cliente_venda_path(@cliente, @venda), notice: 'A Venda foi registrada!' }
        format.json { render :show, status: :created, location: @venda }
      else
        format.html { render :new }
        format.json { render json: @venda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vendas/1
  # PATCH/PUT /vendas/1.json
  def update
    respond_to do |format|
      if @venda.update(venda_params)
        format.html { redirect_to cliente_venda_path(@cliente, @venda), notice: 'Os dados da Venda foram atualizados!' }
        format.json { render :show, status: :ok, location: @venda }
      else
        format.html { render :edit }
        format.json { render json: @venda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendas/1
  # DELETE /vendas/1.json
  def destroy
    @venda.destroy
    respond_to do |format|
      format.html { redirect_to cliente_vendas_path(@cliente), notice: 'A Venda foi excluída!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def get_cliente
      @cliente = Cliente.find(params[:cliente_id])
    end

    def set_venda
      @venda = @cliente.vendas.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def venda_params
      params.require(:venda).permit(:mercadorias, :data, :obs, :valor)
    end

    def forma_pgto
      params[:venda][:forma_pgto].to_i
    end

    def set_pagamentos
      @pagamentos = @cliente.vendas.find(params[:id]).pagamentos
    end
end
