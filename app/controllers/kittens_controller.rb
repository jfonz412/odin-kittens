class KittensController < ApplicationController
	def new
		@kitten = Kitten.new
	end

	def create
		@kitten = Kitten.new(kitten_params)
		if @kitten.save
			flash[:success] = "Kitten created!"
			redirect_to root_url
		else
			flash.now[:warning] = "Something went wrong, try again..."
			render 'new'
		end
	end

	def index
		@kittens = Kitten.all
		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => @kittens } # def #as_json in model to limit attributes
		end
	end

	def show
		@kitten = Kitten.find(params[:id])
		respond_to do |format|
			format.html # show.html.erb
			format.json { render :json => @kitten } # def #as_json in model to limit attributes
		end
	end

	def edit
		@kitten = Kitten.find(params[:id])
	end

	def update
		@kitten = Kitten.find(params[:id])
		if @kitten.update_attributes(kitten_params)
			flash[:success] = "Kitten updated!"
			redirect_to root_url
		else
			flash.now[:warning] = "Something went wrong, try again..."
			render 'edit'
		end
	end

	def destroy
		@kitten = Kitten.find(params[:id]).destroy
		flash[:success] = "User deleted"
		redirect_to root_url
	end

	private
		def kitten_params
			params.require(:kitten).permit(:name,:age,:cuteness,:softness)
		end
end
