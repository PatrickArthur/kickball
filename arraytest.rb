
    my_array = []

    if my_array.empty?
        puts 'nil'
        else
        my_array2=my_array.sort
        i=0
        my_array2.each do |p|
            i=i+1
            if i==my_array2.length
                max_val=my_array2[my_array2.length-1]
                puts max_val
            end
        end
    end



