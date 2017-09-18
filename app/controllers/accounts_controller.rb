class AccountsController < ApplicationController

	def index
		@client = Client.all
		@accounts = Account.all
	end

	def new
		@account = Account.new
	end

	def create
		@account = Account.new(account_params)

		if @account.save
			redirect_to account_path(@account.id)
		else
			render 'new'
		end

	end

	def show
		@account = Account.find(params[:id])
		@client = @account.client
	end

	def edit
	end

	def update
	end

	def destroy
		@account = Account.find(params[:id])

		if @account.balance > 0
			redirect_to account_path(@account.id)
		else
			@account.destroy!
			redirect_to accounts_path
		end
	end


	private

	def account_params
		params.require(:account).permit(:client_id)
	end

end
