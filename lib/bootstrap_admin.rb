require "bootstrap_admin/engine"
require "bootstrap_admin/application"

module BootstrapAdmin
  class << self
    attr_accessor :application

    def application
      @application ||= ::BootstrapAdmin::Application.new
    end

    # Gets called within the initializer
    def setup
      application.prepare!
      yield(application)
    end

    delegate :routes, :to => :application
    delegate :register, :to => :application
  end
end
