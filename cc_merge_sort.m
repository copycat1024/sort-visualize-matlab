classdef cc_merge_sort < cc_base_sort
    %CC_SELECTION_SORT Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        driver
        d
        name
        i
        j
        k
        s1
        s2
        e1
        e2
        c1
        c2
        l
    end

    methods
        function obj = cc_merge_sort(a);
            function dr = merge_driver(st, en)
                dr = [];
                mi = floor((st + en)/2);
                if st+1 < en;
                    dr = [dr; merge_driver(st, mi)];
                    dr = [dr; merge_driver(mi+1, en)];
                end
                dr = [dr; st mi en];
            end

            obj@cc_base_sort(a);
            obj.name = "Merge Sort";
            obj.driver = merge_driver(1, obj.len);
            obj.d=length(obj.driver);
            obj.i=2;
            obj.init_merge(1)
        end

        function init_merge(obj, i)
            r = obj.driver(i, :);
            obj.s1 = r(1);
            obj.e1 = r(2);
            obj.s2 = r(2)+1;
            obj.e2 = r(3);
            obj.c1 = obj.s1;
            obj.c2 = obj.s2;
            obj.l = 0;
            obj.l = obj.s1:obj.e2;
            obj.j = obj.s1;
        end

        function done = do_merge(obj)
            if obj.j>=obj.e2;
%                disp([obj.data 0 obj.s1 obj.e2]);
                done = true;
                return;
            end
            if obj.c1 > obj.e1;
                p = obj.l(obj.c2 - obj.s1 + 1);
                if p != obj.j
                    obj.swap(obj.j, p);
                    % index of j in l
                    jl = find(obj.l()==obj.j);
                    obj.l(jl) = p;
                end
                % set l(c1) = 0 for easy debug
                obj.l(obj.c2 - obj.s1 + 1) = 0;
                obj.c2++;
                obj.j++;
                done = false;
                return;
            end
            if obj.c2 > obj.e2;
                p = obj.l(obj.c1 - obj.s1 + 1);
                if p != obj.j
                    obj.swap(obj.j, p);
                    % index of j in l
                    jl = find(obj.l()==obj.j);
                    obj.l(jl) = p;
                end
                % set l(c1) = 0 for easy debug
                obj.l(obj.c1 - obj.s1 + 1) = 0;
                obj.c1++;
                obj.j++;
                done = false;
                return;
            end
            p1 = obj.l(obj.c1 - obj.s1 + 1);
            p2 = obj.l(obj.c2 - obj.s1 + 1);
            if obj.less(p1, p2);
                if obj.j != p2;
                    obj.swap(obj.j, p2);
                end
                % index of j in l
                jl = find(obj.l()==obj.j);
                obj.l(jl) = p2;
                % set l(c2) = 0 for easy debug
                obj.l(obj.c2 - obj.s1 + 1) = 0;
                obj.c2++;
            else
                if obj.j != p1;
                    obj.swap(obj.j, p1);
                end
                % index of j in l
                jl = find(obj.l()==obj.j);
                obj.l(jl) = p1;
                % set l(c1) = 0 for easy debug
                obj.l(obj.c1 - obj.s1 + 1) = 0;
                obj.c1++;                
            end
            obj.j++;
            done = false;
        end

        function cont = sort(obj);
            if obj.do_merge();
                if obj.i < obj.d + 1;
                    obj.init_merge(obj.i);
                    obj.i++;
                else
                    cont = false;
                    return;
                end
            end
            cont = true;
        end
    end    
end