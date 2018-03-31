classdef cc_base_sort < handle
    %CC_BASE_SORT Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        swap_count
        comp_count
        old_swap_count
        last_swap
        last_comp
        data
        len
    end

    methods
        function obj = cc_base_sort(a)
            obj.data = a;
            obj.len  = length(a);
            obj.comp_count = 0;
            obj.swap_count = 0;
            obj.old_swap_count = 0;
            obj.last_swap = [];
            obj.last_comp = [];
        end

        function [] = swap(obj, x, y)
            if x == y;
                error("self-swap");
            end
            ret = obj.data;
            m = ret(x);
            ret(x) = ret(y);
            ret(y) = m;
            obj.data = ret;
            obj.swap_count++;
            obj.last_swap = [x y];
        end

        function ret = less(obj, x, y)
            ret = obj.data(x)<obj.data(y);
            obj.comp_count++;
            obj.last_comp = [x y];
        end

        function ret = not_swap(obj)
            ret = (obj.old_swap_count == obj.swap_count);
            obj.old_swap_count = obj.swap_count;
        end


        function v = item(obj, i)
            v = obj.data(i);
        end

        function cont = sort_til_swap(obj)
            while obj.not_swap();
                if ~obj.sort();
                    cont = false;
                    return
                end
            end
            cont = true;
        end
    end
end