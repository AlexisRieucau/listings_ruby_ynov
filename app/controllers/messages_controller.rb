class MessagesController < ApplicationController
  def create
    if params[:message].present?
      Message.create content: params[:message], user_ven_id: Listing.find(params[:id]).user_id, user_ach_id: @current_user.id, listing_id: params[:id]
    end
    redirect_to "/listings"
  end

  def show
    if !@current_user.try(:admin?)
      flash[:error] = "Accès interdit"
      return redirect_to "/users/sign_in"
    end
    @messages = Message.page(params[:page]).per(10)
  end
end