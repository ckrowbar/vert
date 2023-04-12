#!/bin/sh

# Set the start and end dates for the commit period
start_date="2022-01-01"
end_date="2023-01-01"

# Loop through each day in the date range
current_date="$start_date"
while [ "$current_date" != "$end_date" ]
do
    # Create a new commit for the current day
    commit_date="$current_date 12:00:00"
    export GIT_AUTHOR_DATE="$commit_date"
    export GIT_COMMITTER_DATE="$commit_date"
    git commit --allow-empty -m "Commit for $current_date"
    
    # Move to the next day
    current_date=$(date -j -v +1d -f "%Y-%m-%d" "$current_date" "+%Y-%m-%d")
done
