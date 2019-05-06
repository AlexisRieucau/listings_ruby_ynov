module API
  module V1
    class Listings < Grape::API
      include API::V1::Defaults

      resources :listings do
        desc "Return all listings"
        get "", root: :listings do
          Listing.all
        end

        desc "Return a listing"
        params do
          requires :id, type: String, desc: "ID of the listing"
        end
        get ":id", root: "listing" do
          Listing.where(id: permitted_params[:id]).first!
        end

        desc "Create a listing"
        params do
          requires :title, type: String, desc: "Listing title"
          requires :category_id, type: Integer, desc: "Listing category"
          requires :description, type: String, desc: "Listing description"
          requires :price, type: Float, desc: "Listing price"
          requires :user_id, type: Integer, desc: "User who created the listings"
        end
        post do
          Listing.create!({title: permitted_params[:title],
                           category_id: permitted_params[:category_id],
                           description: permitted_params[:description],
                           price: permitted_params[:price],
                           user_id: permitted_params[:user_id]})
        end

        desc "Update a listing"
        params do
          requires :id, type: String, desc: "Listing id"
          optional :title, type: String, desc: "Listing title"
          optional :category_id, type: Integer, desc: "Listing category"
          optional :description, type: String, desc: "Listing description"
          optional :price, type: Float, desc: "Listing price"
          optional :user_id, type: Integer, desc: "User who created the listings"
        end
        put ":id" do
          Listing.find(permitted_params[:id]).update!({title: permitted_params[:title] || Listing.find(permitted_params[:id]).title,
                                                       category_id: permitted_params[:category_id] || Listing.find(permitted_params[:id]).category_id,
                                                       description: permitted_params[:description] || Listing.find(permitted_params[:id]).description,
                                                       price: permitted_params[:price] || Listing.find(permitted_params[:id]).price,
                                                       user_id: permitted_params[:user_id] || Listing.find(permitted_params[:id]).user_id})
        end

        desc "Delete a listing"
        params do
          requires :id, type: String, desc: "ID of the listing"
        end
        delete ":id", root: "listing" do
          Listing.where(id: permitted_params[:id]).first!.destroy
        end
      end
    end
  end
end
