module API
  module V1
    class Auth < Grape::API
      include API::V1::Defaults

      resource :auth do

        desc "Creates and returns access_token if valid login"
        params do
          requires :login, type: String, desc: "Username or email address"
          requires :password, type: String, desc: "Password"
        end
        post :login do

          user = User.where(email: params[:login].downcase).first!

          if user && user.password == params[:password]
            key = ApiKey.create(user_id: user.id)
            {token: key.access_token}
          else
            error!('Unauthorized.', 401)
          end
        end

        desc "Returns pong if logged in correctly"
        params do
          requires :token, type: String, desc: "Access token."
        end
        get :ping do
          authenticate!
          { message: "pong" }
        end

        desc "Delete token on logout"
        params do
          requires :token, type: String, desc: "Access token"
        end
        delete :logout do
          ApiKey.where(access_token: params[:token]).first!.destroy
        end
      end
    end
  end
end