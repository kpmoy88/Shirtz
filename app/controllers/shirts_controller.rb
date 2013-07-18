class ShirtsController < ApplicationController
  before_action :load_shirt, :only => [:edit, :update, :show, :destroy]

  def index
    @shirts = Shirt.search_for(params[:query])
  end

  def show
  end

  def new
    @shirt = Shirt.new
  end

  def edit
  end

  def update
    @shirt.update shirt_params

    if @shirt.save
      redirect_to @shirt
    else
      render 'edit'
    end
  end

  def destroy
    @shirt.destroy
    flash[:notice] = "The '#{@shirt.name}' shirt has been removed."

    redirect_to shirts_path
  end

  def create
    @shirt = Shirt.new(shirt_params)

    if @shirt.save
      redirect_to @shirt
    else
      render 'new'
    end
  end

private

def load_shirt
  @shirt = Shirt.find(params[:id])
end

def shirt_params
  params.require('shirt').permit(:name, :description, :image)
end

end
