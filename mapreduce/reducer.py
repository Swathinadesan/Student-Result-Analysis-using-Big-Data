#!/usr/bin/env python3
import sys

print(
    "Student ID\tName\tMaths\tScience\tEnglish\tComputer\t"
    "Total\tAverage\tPercentage"
)

for line in sys.stdin:
    line = line.strip()

    if not line:
        continue

    parts = line.split("\t")

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

    total = maths + science + english + computer
    average = total / 4
    percentage = (total / 400) * 100

    print(
        f"{student_id}\t{name}\t"
        f"{maths}\t{science}\t{english}\t{computer}\t"
        f"{total}\t{average:.2f}\t{percentage:.2f}%"
    )
