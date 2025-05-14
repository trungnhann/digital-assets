class HealthController < ApplicationController
  def check
    db_status = check_database_connection

    render json: {
      status: db_status[:connected] ? 'OK' : 'ERROR',
      environment: Rails.env,
      app_name: 'Digital Assets',
      version: '1.0.0',
      database: {
        status: db_status[:connected] ? 'Connected' : 'Disconnected',
        message: db_status[:message]
      }
    }, status: db_status[:connected] ? :ok : :service_unavailable
  end

  private

  def check_database_connection
    ActiveRecord::Base.connection.execute('SELECT 1')
    {
      connected: true,
      message: 'Database connection successful'
    }
  rescue StandardError => e
    {
      connected: false,
      message: "Database connection failed: #{e.message}"
    }
  end
end
