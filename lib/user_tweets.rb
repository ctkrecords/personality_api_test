module UserTweets
    def self.twitter_search(username)
        client = Twitter::REST::Client.new do |config|
            config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
            config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
            config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
            config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
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
