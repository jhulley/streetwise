namespace :latest_crimes do
  desc 'connect to SFGOV api and grab last 3 months of crime data'
  task seed: :environment do

    IGRNORED_CATEGORIES = [
      "NON-CRIMINAL",
      "BAD CHECKS",
      "BRIBERY",
      "TRESPASS",
      "EMBEZZLEMENT",
      "FRAUD"
    ]

    client = SODA::Client.new({:domain => "data.sfgov.org", app_token: ENV['DATA_TOKEN']})

    all_responses = response = client.get("tmnf-yvry")
    prev_response_count = all_responses.length

    until prev_response_count < 1000
      response = client.get("tmnf-yvry", { "$offset" => all_responses.length })
      all_responses += response
      prev_response_count = response.length
      puts "#{prev_response_count} Crimes fetched from the last API call"
    end

    puts "#{all_responses.length} Crimes added to the database"

    all_responses.each do |crime|
      if !IGRNORED_CATEGORIES.include?(crime['category'])
        crime.delete('location')
        crime["date"] = Time.at(crime["date"])
        Crime.create(crime)
      end
    end
  end
end
