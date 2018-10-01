function median = shellSort_hibbard( array )

n = length(array);

k = 1;
gap = 2^k - 1;
gaps = [];
while(ceil(gap) <= n)
    gaps =[gaps gap] ;
    k = k + 1;
    gap = 2 ^ k - 1;
end
%disp(gaps)
%disp('loaded');

lenGaps = length(gaps);

for i=lenGaps:-1:1
    array = insSort(array , gaps(i) , n);
end

median = array(ceil(n/2));

end

function res = insSort(array , gap , n)
    for i = gap : n
        key = array(i);
        j = i;
        while j > gap && array(j - gap) > key
            array(j) = array(j-gap);
            j =  j - gap;
        end
        array(j) = key;
    end
    res = array;
end