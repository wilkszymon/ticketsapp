class TicketsController < ApplicationController

  before_action :require_user  

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(params_ticket)
    @ticket.user_id = nil
    if @ticket.save
      redirect_to tickets_path
    else
      render 'new'
    end
  end

  def show
    
  end

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def update
    @ticket = Ticket.find(params[:id])
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
    @ticket = Ticket.find(params[:id])
    @ticket.destroy
    flash[:notice] = "Usunieto"
    redirect_to tickets_path
  end

  private
    def params_ticket
      params.require(:ticket).permit(:name, :description, :important, :city, :user_id)
    end
end
