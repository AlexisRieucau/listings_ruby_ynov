class ListingsController < ApplicationController
  def index
    @listings = Listing.page(params[:page]).per(10)
    @categories = Category.all
  end

  def contact
    if !@current_user
      flash[:error] = "Accès interdit"
      return redirect_to "/users/sign_in"
    end
    @listing_msg = Listing.find(params[:id])
  end

  def show
    if !@current_user
      flash[:error] = "Accès interdit"
      return redirect_to "/users/sign_in"
    end
    @categories = Category.all
  end

  def create
    if !@current_user
      flash[:error] = "Accès interdit"
      return redirect_to "/users/sign_in"
    end
    begin
      Listing.create title: params[:title], category_id: params[:category_id], description: params[:description], price: params[:price], user_id: @current_user.id
      redirect_to "/listings"
    rescue Exception => e
      redirect_to request.referrer || root_path
    end
  end

  def delete
    Listing.find(params[:id]).destroy
    redirect_to "/listings"
  end

end
