desc "Use one time pad to encrypt a message"

# Based on this docs
# https://apidock.com/rails/v6.0.0/ActionController/RequestForgeryProtection/xor_byte_strings

task :one_time_pad => :environment do

  # key (one_time_pad) must be the same length as the raw_token. 
  # This is just a demo. In production, the secret MUST NOT be hardcoded! Use ENV variables. 
  one_time_pad ='c7021a8991e6'
  raw_token = '{user_id: 4}'

  # alternative to use a longer and more secure secret
  # one_time_pad = SecureRandom.hex(64)
  # message = '{user_id: 9}'
  # raw_token = message + SecureRandom.hex((128 - message.length)/2)
  # puts "raw_token: #{raw_token}"
  
  puts "Encrypting and encoding -->"

  # encrypt using one time pad encryption
  encrypted_token = xor_byte_strings(one_time_pad, raw_token)
  puts "encrypted_token: --#{encrypted_token}--"

  # encode token
  base64 = Base64.strict_encode64(encrypted_token)
  puts "base64: #{base64}"
  
  puts "Decoding and decrypting -->"

  et = Base64.strict_decode64(base64)
  puts "et: --#{et}--"

  # only the correct decrypting key reveals the message
  one_time_pad ='c7021a8991e6'

  rt = xor_byte_strings(one_time_pad, et)
  puts "rt: #{rt}"

end

def xor_byte_strings(s1, s2) # :doc:
  s2 = s2.dup
  size = s1.bytesize
  i = 0
  while i < size
    s2.setbyte(i, s1.getbyte(i) ^ s2.getbyte(i))
    i += 1
  end
  s2
end