class TweetsController < ApplicationController
  def index
    #dbから呼び出すデータのidを保存
    n=1
    #tweetの間隔
    interval=60*30
    while true
      @tweet=Tweet.find(n)
      TweetBot.tweet(@tweet.image_url,@tweet.number)
      sleep(interval)
      # Tweet.cout==データベースに入ってるデータの数になる
      # 周期を変えたいなら，ここを任意の数にする
      if n==Tweet.count
        n=1
      elsif
        n=n+1
      end
    end
  end
end
