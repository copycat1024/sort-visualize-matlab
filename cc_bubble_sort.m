classdef cc_bubble_sort < cc_base_sort
    %CC_SELECTION_SORT Summary of this class goes here
    %   Detailed explanation goes here

    properties
        i
        j
        bubble_old_swap
        name
    end

    methods
        function obj = cc_bubble_sort(a);
            obj@cc_base_sort(a);
            obj.i = 1;
            obj.j = obj.len;
            obj.bubble_old_swap = obj.swap_count;
            obj.name = "Bubble Sort";
        end

        function cont = sort(obj);
            if obj.j <= obj.i;
                if obj.bubble_old_swap == obj.swap_count;
                    cont = false;
                    return;
                end
                obj.bubble_old_swap = obj.swap_count;
                obj.i++;
                obj.j = obj.len;
            end
            if obj.i > obj.len;
                cont = false;
                return;
            end
            if obj.less(obj.j-1, obj.j);
                obj.swap(obj.j-1, obj.j);
            end
            cont = true;
            obj.j--;
        end
    end    
end

