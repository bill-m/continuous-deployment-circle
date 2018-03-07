#!/bin/bash
# Delete old versions of an app in GCP, assumes current gloud account has necessary rights
#
# Usage:
# ./prune-gcp-versions.sh ProjectID [number to keep]
# * where [gcpproj] is the target project in GCP
# * where [number to keep] is the number of versions to keep, defaults to 3


if [ "$1" != "" ]; then
    gcpproj=$1
else
    echo "Must specify project"
	exit 1
fi

if [ "$2" != "" ]; then
    numtokeep=$2
else
    numtokeep=3
fi

if [ $numtokeep -lt 1 ]; then
	echo "Number of versions to keep must be more than 0"
	exit 1
fi

versions=$(gcloud app versions list --project $gcpproj --sort-by "~LAST_DEPLOYED" --format "table[no-heading](LAST_DEPLOYED, version.id)" | awk '{ print $2 }')

count=0
echo "Keeping the $numtokeep latest versions of $gcpproj"
for ver in $versions
do
    ((count++))
    if [ $count -gt $numtokeep ]
    then
      echo "Deleting version $ver of $gcpproj"
      gcloud app versions delete $ver --project $gcpproj -q
    else
      echo "Keeping version $ver of $gcpproj"
    fi
done