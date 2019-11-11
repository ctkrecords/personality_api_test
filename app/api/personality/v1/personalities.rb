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
                        response = UserTweets.twitter_search(params[:username])
                        #User.create!(username: params[:username])
                        present response
                    end
                end
            end
        end
    end
end
