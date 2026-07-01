from pathlib import Path
text = Path('tempapp.i').read_text(encoding='utf-8', errors='ignore')
for pat in ['print_utf8_printf', '#define printf', '学号：%s', '课程编号：%s']:
    print('---', pat)
    for i, line in enumerate(text.splitlines(), 1):
        if pat in line:
            print(i, line)
