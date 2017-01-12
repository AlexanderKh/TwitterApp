feature 'Tweets' do
  let(:tweets_page) { TweetsPage.new }

  let(:user) { create :user }
  before { login user }

  context 'without tweets' do
    let(:text) { "Hello i'm a developer" }
    let(:long_text) { Faker::Lorem.characters(120) }

    scenario 'create tweet' do
      tweets_page.open
      tweets_page.fill_tweet_form(text)
      tweets_page.submit_tweet_form

      tweets_page.list_tweets.should eq [text]
    end

    scenario 'error when creating tweet over 100 symbols' do
      tweets_page.open
      tweets_page.fill_tweet_form(long_text)
      tweets_page.submit_tweet_form

      expect(page).not_to have_content(long_text)
    end

  end
end
