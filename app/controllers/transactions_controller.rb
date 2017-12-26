class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = Transaction.all
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
    @usuarios = Usuario.all
    @accounts = Account.all    
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
    @usuarios = Usuario.all
    @accounts = Account.all

  end

  # GET /transactions/1/edit
  def edit
    @usuarios = Usuario.all
    @accounts = Account.all    

  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)
    account = Account.find(@transaction.accounts_id)
    if account.limite < @transaction.valor
        flash[:error] = "Valor da Transação excede ao limite da conta"
        return redirect_to transactions_path
    end
    
    doneTransaction = account.beginTransaction(@transaction.tipo,@transaction.valor,@transaction.recipient)
    unless doneTransaction
      flash[:error] = account.errors.first
      return redirect_to transactions_path
    end



    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @transaction.rollBack()
    @transaction.destroy
    respond_to do |format|
        format.html { redirect_to transactions_url, notice: 'Transação estornada com sucesso!' }
        format.json { head :no_content }
      end

  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:accounts_id, :valor, :tipo, :usuario_id,:recipient)
    end
end
