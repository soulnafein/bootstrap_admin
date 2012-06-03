require 'bootstrap_admin/router'
require 'bootstrap_admin/resource'
require 'bootstrap_admin/controller_factory'
require 'bootstrap_admin/helpers/settings'

module BootstrapAdmin
  class Application
    include Settings

    def initialize
      @router = Router.new(self)
      @resources = []
    end

    attr_reader :router, :resources

    setting :load_paths, [File.expand_path('app/admin', Rails.root)]

    def routes(rails_router)
      load!
      router.apply(rails_router)
    end

    def register(resource_class)
      resource = Resource.new(resource_class)
      @resources << resource
      ControllerFactory.create_resource_controller(resource)
    end

    def prepare!
      remove_bootstrap_admin_load_paths_from_rails_autoload_and_eager_load
    end

    def remove_bootstrap_admin_load_paths_from_rails_autoload_and_eager_load
      ActiveSupport::Dependencies.autoload_paths.reject!{|path| load_paths.include?(path) }
      Rails.application.config.eager_load_paths = Rails.application.config.eager_load_paths.reject do |path|
        load_paths.include?(path)
      end
    end

    private
      def load!
        files_in_load_path.each{|file| load file }
      end

      def files_in_load_path
        load_paths.flatten.compact.uniq.collect{|path| Dir["#{path}/**/*.rb"] }.flatten
      end
  end
end
