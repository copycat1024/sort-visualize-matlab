clear all;
format compact;

% Input ---

array = randperm(25);
%array = 25:-1:1; %sorted array
%array = 1:25; %reverse array

algo  = {
    cc_selection_sort(array),
    cc_bubble_sort(array),
    cc_heap_sort(array),
    cc_merge_sort(array),
};

% Program setup
mybar = cc_bar(array);
num = length(algo);
cont = cell(num, 1);
for i=1:num;
    cont(i) = true;
end

function [] = animate_algo(bar, algo, num)
    clf();
    for i=1:num
        sub = bar.make_sub(num, i);
        title(sub, algo{i}.name);
        bar.draw_bar(sub, algo{i}.data, "b", algo{i}.last_swap, "r");
    end
    drawnow;
    pause(0.1);
end

function ret = any_cont(c)
    for i=1:length(c);
        if c{i};
            ret = true;
            return;
        end
    end
    ret = false;
end

animate_algo(mybar, algo, num);
while any_cont(cont);
    for i=1:num;
        cont{i} &= algo{i}.sort_til_swap();
    end
    animate_algo(mybar, algo, num);
end

printf("Result: ============\n");
for i=1:num;
    printf("Algorithm:     %s\n", class(algo{i}));
    printf("Compare count: %i\n", algo{i}.comp_count);
    printf("Swap count:    %i\n", algo{i}.swap_count);
end