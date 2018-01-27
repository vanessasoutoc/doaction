require "grape-swagger"

module API  
    module V1
        class Base < Grape::API
             
            
            # mount API::V1::Notices
            # mount API::V1::Events
            # mount API::V1::Surveys
            # mount API::V1::Options
            # mount API::V1::Births
            # mount API::V1::Utils
            # mount API::V1::Votes
            # mount API::V1::AnotherResource

            add_swagger_documentation(
                api_version: "v1",
                hide_documentation_path: true,
                mount_path: "/api/v1/swagger_doc",
                hide_format: true
                )
        end
    end
end  