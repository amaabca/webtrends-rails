class TestsController < ActionController::Base
  include Rails.application.routes.url_helpers
  include Webtrends::Rails::Controller

  def render(*attributes); end

  expose(:model)

  track :model, only: :index

  def index
  end
end