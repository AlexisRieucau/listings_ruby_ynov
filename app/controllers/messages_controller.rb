class MessagesController < ApplicationController
  def create
    if params[:message].present?
      Message.create content: params[:message], user_ven_id: 1, user_ach_id: 1, listing_id: params[:id]
    end
    redirect_to "/listings"
  end

  def show
    if !@current_user.try(:admin?)
      flash[:error] = "Accès interdit"
      return redirect_to "/users/login"
    end
    @messages = Message.page(params[:page]).per(10)
  end
end