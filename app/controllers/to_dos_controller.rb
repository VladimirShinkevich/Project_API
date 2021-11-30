class ToDosController < ApplicationController

	def destroy
		@to_do = ToDo.find(params[:id])
		@to_do.destroy
	end
end
