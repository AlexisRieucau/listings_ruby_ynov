require 'grape-swagger'

module API
  module V1
    class Base < Grape::API
      mount API::V1::Listings
      mount API::V1::Categories
      mount API::V1::Users
      mount API::V1::Messages
      mount API::V1::Auth

      add_swagger_documentation(
          api_version: "v1",
          hide_documentation_path: true,
          mount_path: "/api/v1/swagger_doc",
          hide_format: true
      )
    end
  end
end
