class BookCommentsController < ApplicationController
	def create
		book = Book.find(params[:book_id])
		book_comment = book.book_comments.new(comment_params)
		book_comment.user_id = current_user.id
		# book_comment.book_id = book.id
		book_comment.save
		redirect_back(fallback_location: root_path)
	end

	def destroy
		BookComment.find_by(params[:id], params[:book_id]).destroy
		redirect_back(fallback_location: root_path)
	end

	private
	def comment_params
		params.require(:book_comment).permit(:comment)
	end
end
