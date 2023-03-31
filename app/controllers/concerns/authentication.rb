module Authentication
  private

  def authenticate_with_token
    @token ||= request.headers['Authorization']
    unless valid_token?
      render json:{errors:"Please, type a valid token on header Authorization"},
             status: :unauthorized
    end
  end

  def valid_token?
    @token.present?
  end
end