json.array!(@kuizuws) do |kuizuw|
  json.extract! kuizuw, :id, :anumber
  json.url kuizuw_url(kuizuw, format: :json)
end
