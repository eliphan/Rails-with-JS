module BooksHelper

    def display_edit(book)
        link_to("Edit book",edit_book_path(book))if !book.user.nil? && book.user = current_user
    end

    def display_create_chapter(book)
        link_to("Create a new chapter",new_book_chapter_path(book)) if !book.user.nil? && book.user = current_user
    end

    def display_complete_check(book)
        if book.finished?
            "This book is finshed."
        else
            "This book is not finished."
        end
    end

    def form_for_book_status(book)
        if !book.finished && book.user == current_user
            form_for(book) do |f|
                
                f.check_box :finished, class: "toggle"
            end
        end
    end
 
end
