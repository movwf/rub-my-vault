require 'bcrypt'

require_relative 'setup_db'
require_relative 'models/Password'

new_pass = Password.create(domain: 'google.com',
                           username: 'a@a.com',
                           password: BCrypt::Password.create('123456'))


new_pass.save