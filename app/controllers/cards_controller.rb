class CardsController < ApplicationController
  before_action :find_card,
                only: [:show, :edit, :update, :destroy]
  before_action :require_login


  def index
    @cards = current_user.cards.all
  end


  def show
  end


  def new
    @card = current_user.cards.new
  end

  def edit
  end

  def create
    @card = current_user.cards.new(card_params)

    if @card.save
      redirect_to @card
    else
      render 'new'
    end
  end

  def update
    if @card.update(card_params)
      redirect_to @card
      flash[:success] = "Successfully updated card."
    else
      render 'edit'
    end
  end

  def destroy
    @card.destroy
    flash[:danger] = "Card deleted."
    redirect_to cards_path
  end

  private

  def card_params
    params.require(:card).permit(:original_text, :translated_text, :review_date, :image)
  end


  def find_card
    @card = current_user.cards.find(params[:id])
  end

  def not_authenticated
    flash[:danger] = "Please log in first!"
    redirect_to log_in_path
  end

end
