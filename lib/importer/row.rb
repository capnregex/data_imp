module Importer
  class Row < ActiveSupport::HashWithIndifferentAccess
    def respond_to_missing?(method, include_private = false)
      has_key?(method) || super
    end

    def method_missing(method, *_args)
      return nil unless has_key? method
      value = self[method]
      case method
      when /_ct$/ # count field default to 0
        value || 0
      when /_bt$/ # wierd binary field
        value = value.to_i
        !(value.nil? || value.zero?)
      else
        value
      end
    end
  end
end
