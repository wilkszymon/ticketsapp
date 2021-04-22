class TicketsController < ApplicationController

  

  def new
    @ticket = Ticket.new
  end

  def create

  end

  def show
    
  end

  def edit
  end

  def index
    @tickets = Ticket.search(params[:search])
  end
end
