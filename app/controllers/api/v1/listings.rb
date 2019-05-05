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
      end
    end
  end
end
