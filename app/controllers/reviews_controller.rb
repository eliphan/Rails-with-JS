class ReviewsController < ApplicationController
    before_action :set_user

    def create
        @review = Review.create(review_params)
        @review.save
        redirect_to @review.book
    end

    def update
        @review = Review.find(params[:id])
        @review.update(review_params)
        redirect_to book_review_path(@review.book, @review)
    end

    def destroy
        @review = Review.find(params[:id])
        @review.destroy
        redirect_to book_path(@review.book)
    end

    private
        def review_params
            params.require(:review).permit(
                :content, 
                :user_id, 
                :book_id, 
                user_attributes:[:username]
                )
        end

end 
