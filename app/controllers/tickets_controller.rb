class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :require_user  

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(params_ticket)
    @ticket.user_id = nil
    @ticket.status_id = 1
    if @ticket.save
      redirect_to tickets_path
    else
      render 'new'
    end
  end

  def show
    
  end

  def edit
  end

  def update
    if @ticket.update(params_ticket)
        flash[:notice] = "Update a ticket"
        redirect_to tickets_path
    else
        render 'edit'
    end
  end

  def index
    @tickets = Ticket.search(params[:search])
  end

  def destroy
    @ticket.destroy
    flash[:notice] = "Deleted"
    redirect_to tickets_path
  end

  private 

    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    def params_ticket
      params.require(:ticket).permit(:name, :description, :important, :city, :user_id, :status_id)
    end
end
