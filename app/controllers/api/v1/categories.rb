module API
  module V1
    class Categories < Grape::API
      include API::V1::Defaults

      resources :categories do
        desc "Return all categories"
        get "", root: :categories do
          Category.all
        end

        desc "Return a category"
        params do
          requires :id, type: String, desc: "ID of the category"
        end
        get ":id", root: "category" do
          Category.where(id: permitted_params[:id]).first!
        end

        desc "Create a category"
        params do
          requires :name, type: String, desc: "Category name"
        end
        post do
          Category.create!({name: permitted_params[:name]})
        end

        desc "Update a Category"
        params do
          requires :id, type: String, desc: "Category id"
          optional :name, type: String, desc: "Category name"
        end
        put ":id" do
          Category.find(permitted_params[:id]).update!({name: permitted_params[:name] || Category.find(permitted_params[:id]).name})
        end

        desc "Delete a Category"
        params do
          requires :id, type: String, desc: "ID of the Category"
        end
        delete ":id", root: "category" do
          Category.where(id: permitted_params[:id]).first!.destroy
        end
      end
    end
  end
end
