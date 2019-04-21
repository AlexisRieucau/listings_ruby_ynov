class CategoriesController < ApplicationController
  def delete
    if !@current_user.try(:admin?)
      return redirect_to "/#{I18n.locale}/users/sign_in"
    end
    Listing.where(:category_id => params[:id]).destroy_all
    Category.find(params[:id]).destroy
    redirect_to "/#{I18n.locale}/"
  end

  def update
    if !@current_user.try(:admin?)
      return redirect_to "/#{I18n.locale}/users/sign_in"
    end
    Category.find(params[:id]).update name: params[:id]
    redirect_to "/#{I18n.locale}/"
  end
end
