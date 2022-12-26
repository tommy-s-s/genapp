module ApplicationHelper
    #ページごとの完全なタイトルを返す
    def full_title(page_title = '')
        base_title = "ComSys"
        if page_title.empty?
            base_title
        else
            page_title + " from" + base_title
        end
    end
end
