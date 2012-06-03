module BootstrapAdmin
  class ControllerFactory
    def self.create_resource_controller(resource)
      default_namespace = retrieve_or_create_default_namespace
      c = Class.new(ResourcesController)
      controller_name = "#{resource.controller_name}"
      c.resource = resource
      default_namespace.const_set controller_name, c
    end

    private
    def self.retrieve_or_create_default_namespace
      Object.const_get 'Admin'
    rescue NameError
      Object.const_set 'Admin', Module.new
    end
  end
end
