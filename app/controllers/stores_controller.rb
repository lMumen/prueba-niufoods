class StoresController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:sync_store]

	def sync_store
		return render json: { error: "Missing parameters" }, status: 400 unless params[:store]

		@store = Store.find_by(id: params[:id])
		return render json: { error: "Invalid store id" }, status: 400 unless @store.present?

		SyncStoreJob.perform_later(params[:id], store_params)
		render json: { status: "Store update started successfully" }
	end

	def index
		@stores = Store.all
	end

	def show
		@store = Store.find(params[:id])
	end

	private

	def store_params
		params.require(:store).permit( devices_info: [:name, :kind, :code, :status])
	end
end
