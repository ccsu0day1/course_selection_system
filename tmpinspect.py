with open('data/generated_1000.csv','rb') as f:
    lines = list(f)
    for i in range(165,176):
        idx = i-1
        if idx < len(lines):
            line = lines[idx]
            try:
                s = line.decode('utf-8')
            except Exception:
                s = repr(line)
            print(i, repr(line))
            print('decoded:', s.rstrip('\r\n'))
        else:
            print(i, '<no such line>')
