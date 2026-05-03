import sys

def reducer():
    current_month = None
    current_area_sum = 0
    
    for line in sys.stdin:
        line = line.strip()
        if not line:
            continue
            
        try:
            month, area = line.split('\t', 1)
            area = float(area)
        except ValueError:
            continue

        if current_month == month:
            current_area_sum += area
        else:
            if current_month:
                print(f"{current_month}\t{current_area_sum:.2f}")
            current_month = month
            current_area_sum = area

    if current_month:
        print(f"{current_month}\t{current_area_sum:.2f}")

if __name__ == "__main__":
    reducer()
