module Personality
    class Base < Grape::API
        mount Personality::V1::Personalities
    end
end