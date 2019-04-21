class CategoriesController < ApplicationController
  def delete
    Category.find(params[:id]).destroy
    redirect_to "/"
  end

  def update
    Category.find(params[:id]).update name: params[:id]
    redirect_to "/"
  end
end
