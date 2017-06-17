ActionDispatch::Request.parameter_parsers[:json] = lambda do |params|
  data = ActiveSupport::JSON.decode(params)
  data = { _json: data } unless data.is_a?(Hash)

  data.deep_transform_keys!(&:underscore)
end
