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

                desc 'Return the attribute pass on the uri'
                route_param :username do 
                    get do
                        usname = params[:username]
                        #User.create!(username: params[:username])
                        present usname 
                    end
                end
            end
        end
    end
end
