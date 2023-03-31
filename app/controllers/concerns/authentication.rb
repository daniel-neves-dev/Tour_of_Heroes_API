module Authentication
  private

  def authenticate_with_token
    @token ||= request.headers['Authorization']
    unless valid_token?
      render json:{errors:"You have no permission to do this operation"},
             status: :unauthorized
    end
  end

  def valid_token?
    @token.present? && @token == Rails.application.credentials.token
  end
end