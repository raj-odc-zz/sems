json.data do |json|
  json.array!(@amount_transactions) do |transaction|
    json.id transaction.id
    json.profile transaction.profile.name
    json.fees_type transaction.parent.fees_type.name
    json.amount transaction.amount
  end
end
json.total @amount_transactions.count