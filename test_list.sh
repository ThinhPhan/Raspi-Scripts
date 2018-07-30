programs=list_programs.txt

set -f
IFS='
'
for name in $(cat $programs) ; do
  echo $name
done