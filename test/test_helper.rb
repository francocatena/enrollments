ENV['RAILS_ENV'] = 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'sidekiq/testing/inline'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  def error_message_from_model(model, attribute, message, extra = {})
    ::ActiveModel::Errors.new(model).generate_message(attribute, message, extra)
  end
end

class ActionController::TestCase
    include Devise::TestHelpers
end

class ActionView::TestCase
  include SimpleForm::ActionViewExtensions::FormHelper
end
