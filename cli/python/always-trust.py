import sys

responses = {
  'local': list(sys.stdin.readline())[:-1],
  'opponent': list(sys.stdin.readline())[:-1]
}

sys.stdout.write("C\n")
