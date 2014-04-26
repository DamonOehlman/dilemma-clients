import sys

responses = {
  'local': list(sys.stdin.readline())[:-1],
  'opponent': list(sys.stdin.readline())[:-1]
}

print responses

sys.stdout.write("C\n")
