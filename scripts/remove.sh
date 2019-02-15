PARA_CNT=$#
mkdir -p /tmp/delete
NOW=`date +%Y-%m-%d_%H:%M:%S`
for i in $*;
do
	fileName=`basename $i`
	mv $i /tmp/delete/$fileName.$NOW
done
