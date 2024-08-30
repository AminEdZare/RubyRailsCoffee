class CommentsController < ApplicationController
  http_basic_authenticate_with name: ENV['USERNAME'], password: ENV['SECRET_PASS']

    def create
      @coffee_cup = CoffeeCup.find(params[:coffee_cup_id])
      @comment = @coffee_cup.comments.create(comment_params)
      redirect_to coffee_cup_path(@coffee_cup)
    end
  
    def destroy
      @coffee_cup = CoffeeCup.find(params[:coffee_cup_id])
      @comment = @coffee_cup.comments.find(params[:id])
      @comment.destroy
      redirect_to coffee_cup_path(@coffee_cup), status: :see_other
    end
  
    private
      def comment_params
        params.require(:comment).permit(:commenter, :body, :status)
      end
  end