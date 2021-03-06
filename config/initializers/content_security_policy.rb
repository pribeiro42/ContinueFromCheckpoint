# Be sure to restart your server when you modify this file.

# Define an application-wide content security policy
# For further information see the following documentation
# https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy

Rails.application.config.content_security_policy do |policy|
  policy.default_src :self, :https
  policy.font_src :self, :https, :data
  policy.img_src :self, :https, :data
  policy.object_src :none
  # Allow unsafe_eval in development for Vue.js DevTools.
  if !Rails.env.production?
    policy.script_src :self, :https, :unsafe_eval
    policy.style_src :self, :https, :unsafe_inline
  else
    policy.script_src :self, :https
    policy.style_src :self, :https
  end

  # Allow Webpacker to connect in development
  policy.connect_src :self, :https, 'http://localhost:3035', 'ws://localhost:3035' if Rails.env.development?

  # Specify URI for violation reports
  # policy.report_uri "/csp-violation-report-endpoint"
end

# If you are using UJS then enable automatic nonce generation
Rails.application.config.content_security_policy_nonce_generator = -> (_request) { SecureRandom.base64(16) }

# Report CSP violations to a specified URI
# For further information see the following documentation:
# https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy-Report-Only
# Rails.application.config.content_security_policy_report_only = true
