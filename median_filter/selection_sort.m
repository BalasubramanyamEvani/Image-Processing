function median = selection_sort( array )

n = length(array);

for i = 1 : n-2
    min_init = i;
    for j = i + 1 : n
        if(array(j) < array(min_init))
            min_init = j;
        end
    end
    if (min_init ~= i)
        temp = array(min_init);
        array(min_init) = array(i);
        array(i) = temp;
    end
    if i == ceil(n/2)
        break;
    end
end
%disp(array);
median = array(ceil(n/2));

end