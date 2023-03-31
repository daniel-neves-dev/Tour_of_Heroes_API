module Authentication
  private

  def authenticate_with_token
    @token ||= request.headers['Authorization']
    unless valid_token?
      render json:{errors:"Type a token authorization with ate least 5 characters "},
             status: :unauthorized
    end
  end

  def valid_token?
    @token.present? && @token.length >= 5
  end
end