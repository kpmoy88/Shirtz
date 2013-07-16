class ShirtsController < ApplicationController

def index
  @shirts = Shirt.search_for(params[:query])
end

end
