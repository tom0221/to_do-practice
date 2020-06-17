class ListsController < ApplicationController

	def new
		@list = List.new
	end

	def create
		@list = List.new(list_params)
		@list.save
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


	private
	def list_params
		params.require(:list).permit(:name, :description)
	end
end
