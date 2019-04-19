class ListingsController < ApplicationController
  def index
    @listings = Listing.page(params[:page]).per(10)
    @categories = Category.all
  end

  def contact
    @listing_msg = Listing.find(params[:id])
  end

  def show
    @listing = Listing.find(params[:id])
  end
end
