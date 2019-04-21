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

  def update
    @message = Message.find(params[:id])
    if @message.update content: params[:contenu], user_ven_id: params[:user_ven], user_ach_id: params[:id], listing_id: params[:listing]
      redirect_to "/messages"
    end
  end

  def delete
    Message.find(params[:id]).destroy
    redirect_to "/messages"
  end
end