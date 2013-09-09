json.array!(@records) do |record|
  json.extract! record, 
  json.url record_url(record, format: :json)
end
