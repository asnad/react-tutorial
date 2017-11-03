json.status "SUCCESS_STATUS"
json.messages do
  json.array! @messages do |message|
    json.(
      message,
      :id, :important, :text, :created_at
    )
  end
end
