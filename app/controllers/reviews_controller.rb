class ReviewsController < ApplicationController
    before_action :set_user

    def create
        @review = Review.create(review_params)
        binding.pry
        @review.save
        redirect_to @review.book
    end

    private
        def review_params
            params.require(:review).permit(
                :content, :user_id, :book_id)
        end

end
