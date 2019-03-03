module BooksHelper

    def display_edit(book)
        link_to("Edit book",edit_book_path(book))if !book.user.nil?
    end

    def display_create_chapter(book)
        link_to("Create a new chapter",new_book_chapter_path(book)) if !book.user.nil?
    end


end
