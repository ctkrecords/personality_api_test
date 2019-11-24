module UserTweets
    def self.twitter_search(username)
        client = Twitter::REST::Client.new do |config|
            config.consumer_key        = "Ce1hUsinSHGerD9BL37CKU81p"#ENV.fetch("TWITTER_CONSUMER_KEY")
            config.consumer_secret     = "c4zqxpjt4w2tvvchQWkw4rOhLT3ri4UBgaittiCFeHy1CXtLvJ"#ENV.fetch("TWITTER_CONSUMER_SECRET")
            config.access_token        = "71112106-TpCpyll0ru4p05v9leqiHHZ9NWboxhtjtKqX45wpO"#ENV.fetch("TWITTER_ACCESS_TOKEN")
            config.access_token_secret = "MOJk06Z4mColWVHCzFNsvZYQMuANCojVDyXZ9yyqiAt5u"#ENV.fetch("TWITTER_ACCESS_TOKEN_SECRET")
        end

        begin
            response = client.user_timeline(username, count: 200)
        rescue Twitter::Error => e
            response = nil
        end

        if response.nil?
            response
        else
            cad = ""
            response.each do |tweet|
                cad.concat(tweet.text, "\n")
            end
            cad
        end
    end
end
