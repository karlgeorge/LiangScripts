mkdir -p ~/delete
NOW=`date +%Y-%m-%d_%H:%M:%S`
for i in $*;
do
	fileName=`basename $i`
	mv $i -v ~/delete/$fileName.$NOW
done
