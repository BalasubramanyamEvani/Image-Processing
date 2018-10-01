function median = insertionSort( array )

n = length(array);


for i = 1 : n
    
    key = array(i);
    j = i - 1;
    
    while j >= 1 && array(j) > key
        array(j+1) = array(j);
        j = j - 1;
    end
    
    array(j+1) = key;
    
end

median = array(ceil(n/2));

end