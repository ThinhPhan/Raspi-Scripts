PROGRAMS=list_programs.txt

set -f
IFS='
'
for name in $(cat $PROGRAMS) ; do
  echo $name
done