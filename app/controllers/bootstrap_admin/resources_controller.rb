module BootstrapAdmin
  class ResourcesController < ApplicationController
    class << self
      attr_accessor :resource
    end

    def index
      @resources = resource.list
    end

    protected
    def resource
      self.class.resource
    end
  end
end
