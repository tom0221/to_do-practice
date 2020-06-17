class ListsController < ApplicationController

	def new
		@list = List.new
	end

	def create
		@list = List.new(list_params)
		@list.save
		# @item = Item.new(item_params)
		@item.save
		redirect_to list_path(@list)
	end

	def index
		@lists = List.all
	end

	def show
		@list = List.find(params[:id])
	end

	def edit
		@list = List.find(params[:id])
	end

	def update
		@list = List.find(params[:id])
			if @list.update(list_params)
				redirect_to lists_path
			else
				redirect_to edit_list_path
			end
	end

	def destroy
		@list = List.find(params[:id])
		@list.destroy
		redirect_to lists_path
	end


	private
	def list_params
		params.require(:list).permit(:name, :description)
	end

	def item_params
		params.require(:item).permit(:name)
	end
end
