#!/usr/bin/env python3
import sys

# Hadoop Streaming mapper.
# Input: student result CSV
# Output: subject<TAB>marks for each subject.

for line in sys.stdin:
    line = line.strip()
    if not line or line.startswith("student_id"):
        continue

    parts = line.split(",")
    if len(parts) != 6:
        continue

    subjects = {
        "Maths": parts[2],
        "Science": parts[3],
        "English": parts[4],
        "Computer": parts[5],
    }

    for subject, mark in subjects.items():
        try:
            print(f"{subject}\t{int(mark)}")
        except ValueError:
            pass
