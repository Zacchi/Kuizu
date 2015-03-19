json.array!(@validate_percentages) do |validate_percentage|
  json.extract! validate_percentage, :id
  json.url validate_percentage_url(validate_percentage, format: :json)
end
