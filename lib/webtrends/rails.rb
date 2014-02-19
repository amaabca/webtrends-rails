require "webtrends"
require "webtrends/rails/version"
require "webtrends/rails/model"
require "webtrends/rails/controller"

module Webtrends
  module Rails
    ActiveRecord::Callbacks.send(:include, Webtrends::Rails::Model) if defined? ActiveRecord
    ActionController::Base.send(:include, Webtrends::Rails::Controller) if defined? ActionController
  end
end