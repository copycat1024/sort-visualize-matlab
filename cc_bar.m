classdef cc_bar
    properties
        x
        y
    end

    methods
        function obj = cc_bar(a)
            obj.x = length(a) + 1;
            obj.y = max(a);
        end

        function sub = make_sub(obj, n, i)
            sub = subplot(n, 1, i);
            axis(sub, [0 obj.x 0 obj.y]);
            axis(sub, "off")
        end

        function [] = _draw_rect(obj, sub, i, value, color)
            w = 0.8;
            p = [i-w/2 0 w value];
            rectangle(sub, "Position", p, "FaceColor", color);
        end

        function [] = draw_bar(obj, sub, array, color1, mark, color2)
            norm = setdiff(1:length(array), mark);
            for i=norm;
                obj._draw_rect(sub, i, array(i), color1);
            end
            for i=mark;
                obj._draw_rect(sub, i, array(i), color2);
            end
        end

    end
end