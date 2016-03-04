
require 'rest-client'
require "jwt"
require "pry"

# app_private_key ||= OpenSSL::PKey::RSA.new(File.read("/home/bayarja/.ssh/id_rsa"))
app_private_key ||= OpenSSL::PKey::RSA.new(File.read("/home/bayarja/Codes/client-app/id_rsa"), '12345')
payload = { name: 'jct', app: 1 }

token ||=  JWT.encode payload, app_private_key, 'RS256'

puts token
response = RestClient.post 'http://app.test.byte.mn/v1/1',
  body: { "jct" => token }.to_json,
  headers: { "Content-Type"=>"application/json" }

puts response







