module UserTweets
    def self.twitter_search(username)
        client = Twitter::REST::Client.new do |config|
            config.consumer_key        = ENV.fetch("TWITTER_CONSUMER_KEY")
            config.consumer_secret     = ENV.fetch("TWITTER_CONSUMER_SECRET")
            config.access_token        = ENV.fetch("TWITTER_ACCESS_TOKEN")
            config.access_token_secret = ENV.fetch("TWITTER_ACCESS_TOKEN_SECRET")
        end
        
        #client.user_timeline(username).take(6).collect do |tweet|
        #    puts "#{tweet.user.screen_name}: #{tweet.text}"
        #end

        begin
            response = client.user_timeline(username).take(6)
        rescue Twitter::Error => e 
            response = nil
        end

        if response.nil?
            response = "This username doesn't exists!"
        else
            cad = ""
            response.each do |tweet|
                cad.concat(tweet.text, " ")
            end
            cad
        end
        
        
    end
end