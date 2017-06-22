class KittensController < ApplicationController
	def new
		@kitten = Kitten.new
	end

	def create
		@kitten = Kitten.new(kitten_params)
		if @kitten.save
			redirect_to root_url
		else
			render 'new'
		end
	end

	def index
	end

	def show
	end

	def edit
		@kitten = Kitten.find(params[:id])
	end

	def update
		@kitten = Kitten.find(params[:id])
		if @kitten.update_attributes(kitten_params)
			redirect_to root_url
		else
			render 'edit'
		end
	end

	def destroy
	end

	private
		def kitten_params
			params.require(:kitten).permit(:name,:age,:cuteness,:softness)
		end
end
