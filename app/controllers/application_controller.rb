class ApplicationController < ActionController::API

  before_action :authorized, except: [:welcome, :subjects, :locations]

  SECRET = ENV["JWT_SECRET"]

  ALGORITHM = 'HS256'

  def encode_token(payload)
    token = JWT.encode(payload, SECRET)
  end

  def auth_header
    header = request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      token = auth_header.split(" ")[1]
      begin
        JWT.decode(token, SECRET, true, { algorithm: ALGORITHM })
      rescue JET::DecodeError
        [{}]
      end
    else
    end
  end

  def current_tutor
    if decoded_token
      if tutor_id = decoded_token[0]["tutor_id"]
        @tutor = Tutor.find(tutor_id)
      else
      end
    else
    end
  end

  def current_student
    if decoded_token
      if student_id = decoded_token[0]["student_id"]
        @student = Student.find(student_id)
      else
      end
    else
    end
  end


  def logged_in_tutor?
    !!current_tutor
  end

  def logged_in_student?
    !!current_student
  end

  def authorized
    redirect_to "/" unless logged_in?
  end

end
