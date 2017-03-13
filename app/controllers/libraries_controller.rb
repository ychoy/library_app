class LibrariesController < ApplicationController
  def index
    @libraries = Library.all
  end

  def new
    @library = Library.new
  end

  def create
    @library = Library.create(library_params)
		if @library.id == nil
			flash[:error] = @library.errors.full_messages.join(", ")
			redirect_to new_library_path
		elsif @library
			flash[:success] = "Successfully created library"
    	redirect_to libraries_path
		end
  end

	def show
		@library = Library.find(params[:id])
	end

	def edit
		@library = Library.find(params[:id])
	end

	def update
		@library = Library.find(params[:id])
		if @library.update_attributes(library_params)
			flash[:success] = "Successfully updated library."
			redirect_to library_path(@library)
		else
			flash[:error] = @library.errors.full_messages.join(", ")
			redirect_to edit_library_path(@library)
		end
	end

  private

  def library_params
    params.require(:library).permit(:name, :floor_count, :floor_area)
  end

end
