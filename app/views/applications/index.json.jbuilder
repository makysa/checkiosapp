json.array!(@applications) do |application|
  json.extract! application, :id, :title, :url, :saved_version
  json.url application_url(application, format: :json)
end
