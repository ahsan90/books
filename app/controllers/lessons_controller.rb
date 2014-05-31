class LessonsController < ApplicationController
  def index
  end

def show
    @lesson = Lesson.find(params[:id])
  end

  def new
    @lesson = Lesson.new(params[:id])
    authorize! :create, Lesson, message: "You need to be a moderator to create a new lesson."
  end

  def edit
    @lesson = Lesson.find(params[:id])
    authorize! :edit, @lesson, message: "You need to be a moderator to do that."
  end

  def create
    @lesson = Lesson.new(params[:lesson])
    authorize! :create, @lesson, message: 'You need to be a moderator to do that.'
    if @lesson.save
      redirect_to @lesson
    else
      flash[:error] = "There was an error saving the lesson. Please try again."
      render :new 
    end
  end

  def update
    @lesson = Lesson.find(params[:id])
    authorize! :update, @lesson, message: "You need to be a moderator to do that."
    if @lesson.update_attributes(params[:lesson])
      flash[:notice] = "Lesson was updated."
      redirect_to @lesson
    else
      flash[:error] = "There was an error saving the lesson. Please try again."
      render :edit
    end
  end

  def buy
    @lesson = Lesson.find(params[:lesson_id])

    charge = Stripe::Charge.create(
      card: params[:stripeToken],
      amount: @lesson.cost_in_cents.to_i,
      currency: 'aud',
      description: @lesson.title
    )

    if current_user
      @user = current_user
      flash[:notice] = "#{current_user.name} bought #{@lesson.title}!"
    else
      existing_user = User.find_by_email(params[:stripeEmail])
      if existing_user
        @user = existing_user
      else
        @temp_password = Devise.friendly_token.first(12)
        @user = User.create(email: params[:stripeEmail], password: @temp_password)
      end
      flash[:notice] = "An email confirming your class details is now on its way to you!"
    end

    @referrer = Referrer.find_by_code(session[:referrer])
    Purchase.create(user: @user, lesson: @lesson, referrer: @referrer)
    LessonMailer.lesson_purchase(@user, @lesson, @temp_password).deliver
    redirect_to :back

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to :back
  end
end

