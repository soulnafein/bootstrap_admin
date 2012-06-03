module BootstrapAdmin
  class Resource
    def initialize(resource_class)
      @resource_class = resource_class
    end

    def route_key
      @resource_class.to_s.downcase.pluralize.to_sym
    end

    def controller_name
      "#{@resource_class.to_s.pluralize}Controller"
    end

    def list
      @resource_class.order('id asc')
    end
  end
end
