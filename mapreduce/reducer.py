seen_students = set()

for line in sys.stdin:
    line = line.strip()

    if not line:
        continue

    parts = line.split("\t")

    if len(parts) != 6:
        continue

    student_id = parts[0]

    # Duplicate student check
    if student_id in seen_students:
        continue

    seen_students.add(student_id)

    name = parts[1]
    maths = int(parts[2])
    science = int(parts[3])
    english = int(parts[4])
    computer = int(parts[5])

    total = maths + science + english + computer
    average = total / 4
    percentage = (total / 400) * 100

    result = "PASS" if (
        maths >= 40 and
        science >= 40 and
        english >= 40 and
        computer >= 40
    ) else "FAIL"

    print(
        f"{student_id}\t{name}\t"
        f"{maths}\t{science}\t{english}\t{computer}\t"
        f"{total}\t{average:.2f}\t{percentage:.2f}%\t{result}"
    )
