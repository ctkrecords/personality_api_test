module Personality
    module V1
        class Personalities < Grape::API
            version 'v1', using: :path
            format :json
            prefix :api
            
            resource :users do
                desc 'Return list of users'
                get do
                    users = User.all
                    present users
                end
            end
        end
    end
end
