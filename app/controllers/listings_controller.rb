class ListingsController < ApplicationController
  def index
    @categories = Category.all
    @search_tag = params[:search_tag]
    if params[:search_tag] and params[:category]
      @listings = Listing.where(["title LIKE ? and category_id = ?", "%#{params[:search_tag]}%", "#{params[:category]}"])
    elsif params[:search_tag]
      @listings = Listing.where("title LIKE ?", "%#{params[:search_tag]}%")
    elsif params[:category]
      @listings = Listing.where("category_id = ?", "#{params[:category]}")
    else
      @listings = Listing.all
    end
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
    @listing = Listing.new
  end

  def create
    if !@current_user
      flash[:error] = "Accès interdit"
      return redirect_to "/users/sign_in"
    end
    begin
      Listing.create title: params[:title], category_id: params[:category_id], description: params[:description], price: params[:price], user_id: @current_user.id
      Listing.last.attached_picture.attach(params[:attached_picture])
      redirect_to "/listings"
    rescue Exception => e
      redirect_to request.referrer || root_path
    end
  end

  def delete
    Message.where(:listing_id => params[:id]).destroy_all
    Listing.find(params[:id]).destroy
    redirect_to "/listings"
  end

  def update
    Listing.find(params[:id]).update title: params[:title], category_id: params[:category_id], description: params[:description], price: params[:price], user_id: params[:user]
    redirect_to "/listings"
  end

end
