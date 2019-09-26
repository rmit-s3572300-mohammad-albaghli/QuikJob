
json.jobseeker do
  json.array!@jobseeker do |jobseeker|
    json.name jobseeker.name
  end
end 