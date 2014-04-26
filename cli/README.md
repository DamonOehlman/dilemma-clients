# Dilemma CLI Client Examples

The `cli/` directory contains a number of dilemma clients that are designed to be run using the node dilemma proxy, which can be installed using the following technique:

1. Install node (which will also bring in `npm`)
2. Install the dilemma runner: `npm install -g dilemma`

At this point you will now be able to run your strategy runner using the following command:

```
dilemma --server=<server-uri> --strategy=<name> --cmd=<runner>
```

## How it works

The dilemma runner will register itself with the dilemma server and:

```
dilemma --server=192.168.0.142 --strategy="team1:always-trust" --cmd="python python/always-trust.py"
```
