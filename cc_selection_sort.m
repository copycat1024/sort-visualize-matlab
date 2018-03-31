classdef cc_selection_sort < cc_base_sort
    %CC_SELECTION_SORT Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        i
        j
        name
    end

    methods
        function obj = cc_selection_sort(a);
            obj@cc_base_sort(a);
            obj.i = 1;
            obj.j = 2;
            obj.name = "Selection Sort";
        end
        
        function cont = sort(obj);
            if obj.j > obj.len;
                obj.j = (obj.i++)+2;
            end
            if obj.j > obj.len;
                cont = false;
                return;
            end
            if obj.less(obj.i, obj.j);
                obj.swap(obj.i, obj.j);
            end
            cont = true;
            obj.j++;
        end
    end    
end

