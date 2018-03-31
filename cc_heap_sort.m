classdef cc_heap_sort < cc_base_sort
    %CC_SELECTION_SORT Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        name
        r % root
        s % start
        e % end
        f % flag
    end

    methods
        function obj = cc_heap_sort(a);
            obj@cc_base_sort(a);
            obj.name = "Heap Sort";
            obj.e = 1;
            obj.f = true;
            obj.s = ceil(obj.len/2) + 1;
            obj.r = ceil(obj.len/2) + 1;
        end

        function cont = sift(obj)
            if obj.r > obj.len
                cont = false;
                return;
            end
            left  = obj.r*2 - obj.len - 1;
            right = obj.r*2 - obj.len - 2;
            if right >= obj.e;
                if obj.less(left, right);
                    child = right;
                else
                    child = left;
                end
            else
                child = left;
            end
            if obj.less(obj.r, child);
                obj.swap(obj.r, child);
                obj.r = child;
                cont = (obj.r*2 - obj.len - 1) >= obj.e;
            else
                cont = false;
            end
        end

        function cont = sort(obj);
            if obj.e >= obj.len;
                cont = false;
                return;
            end
            if obj.f;
                if !obj.sift();
                    obj.s++;
                    obj.r = obj.s;
                    obj.f = !(obj.s > obj.len);
                end
            else
                if !obj.sift();
                    obj.swap(obj.e, obj.len);
                    obj.r = obj.len;
                    obj.e++;
                end
            end
            cont = true;
        end
    end    
end

