#!/usr/bin/env bash -x
# This script will repalce the ":r" lines found on the hive metastore scripts
# for SQl Server (mssql), it inserts the file that is referenced by :r in the
# original file.
# ./insertSQLFiles.sh /path/to/mssql/scripts
# You should back up the files on the folder, since the script will modify
# the files

replacesColonR () {
  while IFS=  read -r line
  do
    printf "${line}"|grep '^:r' > /dev/null
    if [ $? -eq 0 ]; then
      f=`printf "${line}" |sed 's/^:r \(.*\)/\1/g'`
      if [ ! -z  "${f}" ]; then
        cat ${f}
      fi
    else
      echo "${line}"
    fi
  done
}

if [ $# -eq 0 ]  && [ -d $1 ]
  then
    echo -e "No arguments supplied\n"
    echo -e "  Usage: $0 /path/to/mss/scripts\n"
    echo -e "You should redirect the output to a file using > myNewFile.mssql.sql\n\n"
    exit 1
fi

cd $1
for i in *upgrade*.mssql.sql 
do
  echo "Processing ${i}."
  cat ${i} | replacesColonR > $i.new
  mv ${i}.new ${i}
done
