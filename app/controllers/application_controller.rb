class ApplicationController < ActionController::API
  def authenticate_request
    token = request.headers['Authorization']&.split(' ')&.last
    decoded = JwtService.decode(token)
    
    if decoded
      @current_user = User.find(decoded['user_id'])
    else
      render json: { error: 'Nije autoriziran' }, status: :unauthorized
    end
  end
end