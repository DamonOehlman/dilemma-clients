import sys

responses = {
  'local': list(sys.stdin.readline())[:-1],
  'opponent': list(sys.stdin.readline())[:-1]
}

if len(responses['local']) > 0:
    sys.stdout.write(responses['local'][0])
else:
    sys.stdout.write("C\n")
