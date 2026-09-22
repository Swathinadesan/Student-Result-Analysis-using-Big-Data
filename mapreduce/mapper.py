#!/usr/bin/env python3
import sys

for line in sys.stdin:
    line = line.strip()

    if not line or line.startswith("student_id"):
        continue

    parts = line.split(",")

    if len(parts) != 6:
        continue

    student_id = parts[0]
    name = parts[1]

    try:
        maths = int(parts[2])
        science = int(parts[3])
        english = int(parts[4])
        computer = int(parts[5])
    except ValueError:
        continue

    print(
        f"{student_id}\t{name}\t"
        f"{maths}\t{science}\t{english}\t{computer}"
    )
