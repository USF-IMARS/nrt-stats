# returns file with most recent mtime
# based on https://stackoverflow.com/a/23034261/1483986

data_subdirs="/thing1/ipopp-nrt/pub/gsfcdata /thing1/ipopp-nrt/pub/data"

l0_dirs=`find $data_subdirs -maxdepth 3 -name level0 -type d`

# inclusion of ./not/a/real/file below is to ensure that we don't accidentally
#   run find with no path arguments (if $ln_dirs is empty)
printf "`find $l0_dirs -name *.PDS -printf \"%T@ %p\n\" | sort -n | cut -d' ' -f 2- | tail -n 1`\n"

