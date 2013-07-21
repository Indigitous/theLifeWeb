require 'devise/strategies/token_authenticatable'

module Devise
  module Strategies

    # Devise Authentication strategy for Google tokens from Android.
    # These tokens come from scope "audience:server:client_id:" + web client id
    class GtokenAuthenticatable < Devise::Strategies::TokenAuthenticatable

      # don't store the current user in the session
      def store?
        false
      end

      # TODO authentication_token && provider == 'google' ? but that is more characters
      def gtoken
        params[:authentication_gtoken]
      end

      # is the request meant for this authenticator?
      def valid?
        puts "IN GTOKEN valid? WITH param[authentication_gtoken] "; puts gtoken
        gtoken
      end

      # Since this request is meant for this authenticator, attempt to authenticate it.
      def authenticate!
        puts "IN GTOKEN authenticate! WITH PARAMS "
        puts gtoken

        # verify against Google
        validator = GoogleIDToken::Validator.new
        google_account = validator.check(gtoken,
                                         "900671345436.apps.googleusercontent.com",
                                         "900671345436-9nlj2spdq75l60eq4j6sbmo27p9crmei.apps.googleusercontent.com")

        # failed to authenticate
        if google_account.nil?
          puts "FAILS! google account"
          return fail(validator.problem) if google_account.nil?
        end

        puts "WORKS! WITH google account"
        puts google_account
        puts google_account["email"]
        puts google_account["id"]

        # successfully verified with Google, so return User, which becomes current_user
        user = User.find_by_email "user1@example.com"
        success!(user)
      end

    end

  end



## I am not sure if I need to include this copyright notice,
## but the following code was adapted from devise models/token_authenticatable.rb,
## so I include the copyright notice here.

#Copyright 2009-2013 Plataformatec. http://plataformatec.com.br
#
#Permission is hereby granted, free of charge, to any person obtaining
#a copy of this software and associated documentation files (the
#"Software"), to deal in the Software without restriction, including
#without limitation the rights to use, copy, modify, merge, publish,
#distribute, sublicense, and/or sell copies of the Software, and to
#permit persons to whom the Software is furnished to do so, subject to
#the following conditions:
#
#The above copyright notice and this permission notice shall be
#included in all copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
#EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
#MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
#NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
#LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
#OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
#WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


  module Models
    module GtokenAuthenticatable
      extend ActiveSupport::Concern

      def self.required_fields(klass)
        [:authentication_token]
      end

      # Generate new authentication token (a.k.a. "single access token").
      def reset_authentication_token
        self.authentication_token = self.class.authentication_token
      end

      # Generate new authentication token and save the record.
      def reset_authentication_token!
        reset_authentication_token
        save(:validate => false)
      end

      # Generate authentication token unless already exists.
      def ensure_authentication_token
        reset_authentication_token if authentication_token.blank?
      end

      # Generate authentication token unless already exists and save the record.
      def ensure_authentication_token!
        reset_authentication_token! if authentication_token.blank?
      end

      # Hook called after token authentication.
      def after_token_authentication
      end

      def expire_auth_token_on_timeout
        self.class.expire_auth_token_on_timeout
      end

      module ClassMethods
        def find_for_token_authentication(conditions)
          find_for_authentication(:authentication_token => conditions[token_authentication_key])
        end

        # Generate a token checking if one does not already exist in the database.
        def authentication_token
          generate_token(:authentication_token)
        end

        Devise::Models.config(self, :token_authentication_key, :expire_auth_token_on_timeout)
      end

    end
  end
end

Warden::Strategies.add(:gtoken_authenticatable, Devise::Strategies::GtokenAuthenticatable)
