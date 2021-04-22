class SearchesController < ApplicationController

    def new 
        @search = Search.new
        # @name = Book.uniq.pluck(:name)
    end

    def create
        @search = Search.create(search_params)
        redirect_to @search
    end

    def show
        @search = Search.find(params[:id])
    end

    private

    def search_params
        params.require(:searche).permit(:name, :description, :important, :city)
    end

end

