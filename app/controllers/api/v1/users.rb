module API
  module V1
    class Users < Grape::API
      include API::V1::Defaults

      resources :users do
        desc "Return all users"
        get "", root: :users do
          User.all
        end

        desc "Return an user"
        params do
          requires :id, type: String, desc: "ID of the user"
        end
        get ":id", root: "user" do
          User.where(id: permitted_params[:id]).first!
        end

        desc "Create an user"
        params do
          requires :first_name, type: String, desc: "User first name"
          requires :last_name, type: String, desc: "User last name"
          requires :password, type: String, desc: "User password"
          optional :role, type: String, desc: "User role (optional)"
          requires :email, type: String, desc: "User email"
        end
        post do
          User.create!({first_name: permitted_params[:first_name],
                           last_name: permitted_params[:last_name],
                           password: permitted_params[:password],
                           role: permitted_params[:role] || nil,
                           email: permitted_params[:email]})
        end

        desc "Update an User"
        params do
          requires :id, type: String, desc: "User id"
          optional :first_name, type: String, desc: "User first name"
          optional :last_name, type: String, desc: "User last name"
          optional :password, type: String, desc: "User password"
          optional :role, type: String, desc: "User role (optional)"
          optional :email, type: String, desc: "User email"
        end
        put ":id" do
          User.find(permitted_params[:id]).update!({first_name: permitted_params[:first_name] || User.find(permitted_params[:id]).first_name,
                                                   last_name: permitted_params[:last_name] || User.find(permitted_params[:id]).last_name,
                                                   password: permitted_params[:password] || User.find(permitted_params[:id]).password,
                                                   role: permitted_params[:role] || nil,
                                                   email: permitted_params[:email] || User.find(permitted_params[:id]).email})
        end

        desc "Delete an user"
        params do
          requires :id, type: String, desc: "ID of the User"
        end
        delete ":id", root: "user" do
          User.where(id: permitted_params[:id]).first!.destroy
        end
      end
    end
  end
end

