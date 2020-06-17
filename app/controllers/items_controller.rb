class ItemsController < ApplicationController
#架空
	def create
		@item = Item.new(item_params)
		@item.save
		redirect_to list_path(list.id)
	end

	def index
		@item = Item.all
	end

	def show
		@item = Item.find(params[:id])
	end

	private
	def item_params
		params.require(:item).permit(:name)
	end
end
