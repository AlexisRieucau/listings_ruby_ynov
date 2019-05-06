module API
  module V1
    class Messages < Grape::API
      include API::V1::Defaults

      resources :messages do
        desc "Return all messages"
        get "", root: :messages do
          Message.all
        end

        desc "Return a message"
        params do
          requires :id, type: String, desc: "ID of the message"
        end
        get ":id", root: "message" do
          Message.where(id: permitted_params[:id]).first!
        end

        desc "Create a Message"
        params do
          requires :content, type: String, desc: "Message content"
          requires :listing_id, type: String, desc: "Listing linked to the message"
          requires :user_ach_id, type: String, desc: "User buying the product"
          requires :user_ven_id, type: String, desc: "User selling the product"
        end
        post do
          Message.create!({content: permitted_params[:content],
                           listing_id: permitted_params[:listing_id],
                           user_ach_id: permitted_params[:user_ach_id],
                           user_ven_id: permitted_params[:user_ven_id]})
        end

        desc "Update a Message"
        params do
          requires :id, type: String, desc: "Message id"
          optional :content, type: String, desc: "Message content"
          optional :listing_id, type: String, desc: "Listing linked to the message"
          optional :user_ach_id, type: String, desc: "User buying the product"
          optional :user_ven_id, type: String, desc: "User selling the product"
        end
        put ":id" do
          Message.find(permitted_params[:id]).update!({content: permitted_params[:content] || Message.find(permitted_params[:id]).content,
                                                       listing_id: permitted_params[:listing_id] || Message.find(permitted_params[:id]).listing_id,
                                                       user_ach_id: permitted_params[:user_ach_id] || Message.find(permitted_params[:id]).user_ach_id,
                                                       user_ven_id: permitted_params[:user_ven_id] || Message.find(permitted_params[:id]).user_ven_id})
        end

        desc "Delete a Message"
        params do
          requires :id, type: String, desc: "ID of the Message"
        end
        delete ":id", root: "message" do
          Message.where(id: permitted_params[:id]).first!.destroy
        end
      end
    end
  end
end

