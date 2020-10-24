#!/bin/bash
wd=`pwd`
sed -i 's/[ ]*//g' cloneall.txt
for path in `cat cloneall.txt`
do
cd "${wd}"
dir=${path#*//}
if [ ! -x "$dir" ]; then
echo "Creating: project in ${wd}/${dir}."
mkdir -p "$dir"
cd "$dir"
deletepath=`pwd`
rm -rf "${deletepath}"
cd ..
echo "Running: git clone ${path}.git."
git clone "${path}.git"
echo "Successfully cloned project ${wd}/${dir}."
fi
done