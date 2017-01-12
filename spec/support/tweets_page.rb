require 'support/base_page'

class TweetsPage < BasePage

  def page_path
    '/#!/tweets'
  end

  def list_tweets
    result = []
    sleep 0.5
    all('.tweets .tweet').each do |tweet|
      result << tweet.find('p').text
    end
    result
  end

  def fill_tweet_form(text)
    within '.tweets-form' do
      fill_in 'content', with: text
    end
  end

  def submit_tweet_form
    within '.tweets-form' do
      find('button', text: 'Tweet').click
    end
  end
end
