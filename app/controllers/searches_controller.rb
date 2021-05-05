class SearchesController < ApplicationController

    before_action :require_user

    def new 
        @search = Search.new
        # @descriptions = Ticket.uniq.pluck(:description)
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
        params.require(:search).permit(:name, :description, :important, :city, :user_id, :status_id)
    end

end

