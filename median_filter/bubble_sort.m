function res = bubble_sort( array , option)

n = length(array);

for i=1:n-1
    for j=1:n-i
        if(array(j) > array(j+1))
            temp = array(j);
            array(j) = array(j+1);
            array(j+1) = temp;
        end
    end
end
if option == 1
    res = array(ceil(n/2));
elseif option == 2
    res = array;

end 