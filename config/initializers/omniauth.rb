OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '318485249752-jfr8l5j12476t3u54s2gsv5t862kvv91.apps.googleusercontent.com', 'mCXPjz1N3AC0x9z3CxvluTaT',
        {
          hd: 'g.ucla.edu',

          client_options: {ssl:
            {ca_file: Rails.root.join("cacert.pem").to_s}
            }
        }
end
