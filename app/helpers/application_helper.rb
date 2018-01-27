module ApplicationHelper

    def bootstrap_class_for(flash_type)
        case flash_type
        when "success"
            "-success"   # Green
        when "error"
            "-danger"    # Red
        when "alert"
            "-warning"   # Yellow
        when "notice"
            "-info"      # Blue
        else
            flash_type.to_s
        end
    end


    def active_class(name)
        controller_name.eql?(name) || current_page?(name) ? 'active' : ''
    end

end
