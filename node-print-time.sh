#!/bin/bash

echo "Script started at: $(date '+%Y-%m-%d %H:%M:%S')"
echo "Monitoring loop... Press Ctrl+C to exit."

# Optional: Limit number of loops for testing
# max_loops=10
# count=0

while true; do
    start_time=$(date +%s.%N)

    sleep 0.5

    end_time=$(date +%s.%N)

    # Use bc for float arithmetic
    time_diff=$(echo "$end_time - $start_time" | bc)

    # Round start and end to integers for readable time
    start_epoch=$(printf "%.0f" "$start_time")
    end_epoch=$(printf "%.0f" "$end_time")

    # Always print diff for visibility
    echo "[Info] Elapsed: $time_diff seconds"

    # Print if delay exceeds threshold
    if (( $(echo "$time_diff >= 0.6" | bc -l) )); then
        echo "⚠️  Delay detected!"
        echo "Start time: $(date -d @$start_epoch '+%Y-%m-%d %H:%M:%S')"
        echo "End time:   $(date -d @$end_epoch   '+%Y-%m-%d %H:%M:%S')"
        echo "Time difference: $time_diff seconds"
        echo "--------------------------------------"
    fi

    # Uncomment for loop limit testing
    # ((count++))
    # if (( count >= max_loops )); then break; fi
done
