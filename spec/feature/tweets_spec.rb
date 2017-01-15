feature 'Tweets' do
  let(:tweets_page) { TweetsPage.new }
  let(:favourites_page) { FavouritesPage.new }

  let(:user) { create :user }
  before { login user }

  context 'without tweets' do
    let(:text) { "Hello i'm a developer" }
    let(:long_text) { Faker::Lorem.characters(120) }

    scenario 'create tweet' do
      tweets_page.open
      tweets_page.fill_tweet_form(text)
      tweets_page.submit_tweet_form

      expect(tweets_page.list_tweets).to eq [text]
    end

    scenario 'error when creating tweet over 100 symbols' do
      tweets_page.open
      tweets_page.fill_tweet_form(long_text)
      tweets_page.submit_tweet_form

      expect(page).not_to have_content(long_text)
    end

  end

  context 'with tweet' do
    let!(:tweet) { create :tweet, user: user }
    let(:text) { 'Some sample text' }

    scenario 'success flow' do
      tweets_page.open
      expect(page).to have_content 'Like 0'
      find('button', text: 'Like 0').click
      expect(page).to have_content 'Like 1'
      find('button', text: 'Edit').click
      within '.tweet' do
        fill_in 'content', with: text
      end
      find('button', text: 'Save').click
      expect(page).to have_content text
      find('button', text: 'Favourite').click
      favourites_page.open
      expect(page).to have_content text
      tweets_page.open
      find('button', text: 'Remove').click
      accept_confirm
      expect(page).not_to have_content text
    end
  end
end
