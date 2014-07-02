#!bin/sh
for file in ./*
do
    if test -f $file
    then
        echo $file 是文件
    fi

    if test -d $file
    then
	    for subFile in $file/*
	    do
            echo $subFile
            filename=`basename $subFile`
            echo "$filename"
            year=`echo $filename | awk '{split($0,a,"-"); print a[1]}'` # = 12
            month=`echo $filename | awk '{split($0,a,"-"); print a[2]}'` # = 12

            if [[ "$month" -le 10 ]]; then
                month=0$month
            fi
            Tmpday=`echo $filename | awk '{split($0,a,"-"); print a[3]}'` # = 56
            day=`echo $Tmpday | awk '{split($0,a,"."); print a[1]}'`

            if [[ "$day" -le 10 ]]; then
                day=0$day
            fi
            echo "$day/$month/$year"
	    	dayone -d="$month/$day/$year" -s=true new < $subFile
	    done
        echo $file 是目录
    fi
done