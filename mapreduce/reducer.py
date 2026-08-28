#!/usr/bin/env python3
import sys

current_subject = None
marks = []

def emit(subject, values):
    if not subject or not values:
        return
    count = len(values)
    average = sum(values) / count
    highest = max(values)
    passed = sum(1 for m in values if m >= 40)
    pass_percentage = (passed / count) * 100
    print(f"{subject}\t{count}\t{average:.2f}\t{highest}\t{pass_percentage:.2f}")

for line in sys.stdin:
    line = line.strip()
    if not line:
        continue

    try:
        subject, mark = line.split("\t")
        mark = int(mark)
    except ValueError:
        continue

    if current_subject is not None and subject != current_subject:
        emit(current_subject, marks)
        marks = []

    current_subject = subject
    marks.append(mark)

emit(current_subject, marks)
