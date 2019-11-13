=begin
require 'ibm_watson'
require 'ibm_watson/authenticators'

module PersonalityInsights
  def self.test_method
    puts "hola desde Personality Insights"
  end
end
=end

require "json"
require 'ibm_watson'
#require "ibm_watson/authenticators"
#require "ibm_watson/personality_insights_v3"
include IBMWatson

authenticator = Authenticators::IamAuthenticator.new(
  apikey: "IpVwSclXM4QTpGJN_ymBGrV2-Xx4MGlrI1f2EgeMh4E9"
)
personality_insights = PersonalityInsightsV3.new(
  version: "2017-10-13",
  authenticator: authenticator
)
personality_insights.service_url = "https://gateway.watsonplatform.net/personality-insights/api"

File.open("assets/tweets.txt") do |profile_json|
  profile = personality_insights.profile(
    accept: "application/json",
    content: profile_json.read,
    content_type: "text/plain; charset=utf-8",
    content_language: "es",
    accept_language: "es"
  )
  puts JSON.pretty_generate(profile.result)
  file = File.open("personality.json", "w")
  file.puts JSON.pretty_generate(profile.result)
  file.close
end

module PersonalityInsights
  def self.test_method
    puts "hola desde Personality Insights"
  end
end