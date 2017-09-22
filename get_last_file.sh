# returns file with most recent mtime
# based on https://stackoverflow.com/a/23034261/1483986
#
# usage examples:
#
# ./get_last_file.sh level1 *.hdf
# ./get_last_file.sh level0 *.PDS

levelstr=$1
nameselector=$2

#echo "finding $nameselector @ $levelstr"

data_subdirs="/thing1/ipopp-nrt/pub/gsfcdata /thing1/ipopp-nrt/pub/data"

l0_dirs=`find $data_subdirs -maxdepth 3 -name $levelstr -type d`

printf "`find $l0_dirs -name $nameselector -printf \"%T@ %p\n\" | sort -n | cut -d' ' -f 2- | tail -n 1`\n"

