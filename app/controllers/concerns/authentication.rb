module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :authenticate
  end

  class_methods do
    def allow_unauthenticated_access(**options)
      skip_before_action :authenticate, options
    end
  end

  def encode(payload)
    now = Time.now.to_i
    JWT.encode(
      {
        data: {
          id: payload.id,
          email_address: payload.email,
          role: payload.role
        },
        exp: now + 2.days.to_i,
        iat: now,
        iss: 'digital_assets_api',
        aud: 'digital_assets_client',
        sub: 'User',
        jti: SecureRandom.uuid,
        nbf: now + 1.second.to_i
      },
      Rails.application.credentials.secret_key_base,
      'HS256',
      {
        typ: 'JWT',
        alg: 'HS256'
      }
    )
  end

  def decode
    JWT.decode(token, Rails.application.credentials.secret_key_base, 'HS256')
  end

  private

  def token
    auth_header = request.headers['Authorization']
    return nil unless auth_header.present? && auth_header.start_with?('Bearer ')

    auth_header.split.last
  end

  def current_user
    decoded = decode
    decoded.first['data'].with_indifferent_access
  end

  def authenticate
    current_user || render(json: { error: 'Unauthorized' }, status: :unauthorized)
  rescue JWT::ExpiredSignature
    render json: { error: 'Token has expired' }, status: :unauthorized
  end
end
