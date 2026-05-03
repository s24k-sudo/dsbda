import sys

def mapper():
    # Columns: X, Y, month, day, FFMC, DMC, DC, ISI, temp, RH, wind, rain, area
    for line in sys.stdin:
        line = line.strip()
        if not line or line.startswith('X'): # Skip header
            continue
        
        data = line.split(',')
        if len(data) >= 13:
            month = data[2]
            try:
                area = float(data[12])
                print(f"{month}\t{area}")
            except ValueError:
                continue

if __name__ == "__main__":
    mapper()
