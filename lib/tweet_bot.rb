# https://blog.hello-world.jp.net/ruby/1923/ を参考に作成
require 'twitter'
require 'open-uri'
require 'dotenv'

class TweetBot
  # クライアントの設定
  @@twitter_client = Twitter::REST::Client.new do |config|
    config.consumer_key       = 'your key'
    config.consumer_secret    = ''
    config.access_token        = ''
    config.access_token_secret = ''
  end

  # tweetするクラスメソッド
  def self.tweet(image_url,str)
    begin
      open(image_url) do |tmp|
        @@twitter_client.update_with_media(str, tmp)
      end
    rescue => e
      STDERR.puts "[EXCEPTION] " + e.to_s
      exit 1
    end
  end
end