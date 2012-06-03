module BootstrapAdmin
  class Router
    def initialize(application)
      @application = application
    end

    def apply(router)
      router.instance_exec(@application.resources) do |resource_configs|
        namespace :admin do
          resource_configs.each do |resource_config|
            resources resource_config.route_key do
            end
          end
        end
      end
    end
  end
end
