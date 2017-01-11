class BasePage
  include Capybara::DSL
  include Rails.application.routes.url_helpers

  def initialize(path = root_path)
    @path = page_path || path
  end

  def open
    visit @path
    self
  end

  def page_path
    '/'
  end
end
