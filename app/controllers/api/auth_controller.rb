class Api::AuthController < ApplicationController
  def register
    user = User.new(
      ime: params[:ime],
      email: params[:email],
      password: params[:password],
      uloga: params[:uloga]
    )

    if user.save
      render json: { message: 'Registracija uspješna!', user: { ime: user.ime, email: user.email, uloga: user.uloga } }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def login
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      token = JwtService.encode({ user_id: user.id, uloga: user.uloga })
      render json: { message: 'Prijava uspješna!', user: { ime: user.ime, email: user.email, uloga: user.uloga }, token: token }
    else
      render json: { error: 'Pogrešan email ili lozinka' }, status: :unauthorized
    end
  end
end