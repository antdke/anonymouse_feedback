class TwitterService
  def self.message(feedback)
    ".@#{feedback.recipient_handle}, '#{feedback.text}' --Anon" # OPTIONAL: "Testing the Twitter API at #{Time.now.to_i}" # timestamp prevents "duplicate content" API error
  end

  def self.tweet!(feedback)
    require 'oauth/request_proxy/typhoeus_request' # TODO: delete

    body = {
      "text": message(feedback)
    }

    @consumer = OAuth::Consumer.new(
      ENV['twitter_consumer_key'],
      ENV['twitter_consumer_secret'],
    )
    @token = OAuth::Token.new(ENV['twitter_oauth_token'], ENV['twitter_oauth_token_secret'])
    options = {
      method: :post,
      headers: {
        "content-type" => "application/json"
      },
      body: body.to_json
    }

    oauth_params = {:consumer => @consumer, :token => @token}

    hydra = Typhoeus::Hydra.new
    url = 'https://api.twitter.com/2/tweets'
    req = Typhoeus::Request.new(url, options)
    oauth_helper = OAuth::Client::Helper.new(req, oauth_params.merge(:request_uri => url))
    req.options[:headers].merge!({"Authorization" => oauth_helper.header})

    response = req.run

    if response.success?
      tweet_id = JSON.parse(response.body)["data"]["id"] # return tweet id
      twitter_username = ENV['twitter_username'] || "twitter"
      tweet_url = "https://twitter.com/#{twitter_username}/status/#{tweet_id}"

      feedback.update(tweet_id: tweet_id, tweet_url: tweet_url)

      # TODO: Delete logs
      puts "Credentials work! Tweet:"
      puts JSON.pretty_generate(JSON.parse(response.body))
      
    else
      puts "Credentials failed, please try generating again."
    end
  end
end