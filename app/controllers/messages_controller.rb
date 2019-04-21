class MessagesController < ApplicationController
  def create
    listing = Listing.find(params[:id])
    if params[:contenu].present?
      Message.create! content: params[:contenu], user_ven_id: listing.user.id, user_ach_id: @current_user.id, listing_id: params[:id]
      ContactMailer.contact(params[:contenu]).deliver_now
    end
    redirect_to "/listings"
  end

  def show
    if !@current_user.try(:admin?)
      return redirect_to "/users/sign_in"
    end
    @messages = Message.page(params[:page]).per(10)
  end
end