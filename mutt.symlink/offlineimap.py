#!/usr/bin/env python3

from socket import gethostname
from subprocess import check_output


def get_pass(account, add_hostname=False):
    if add_hostname:
        account += "_" + gethostname().strip()
    pass_output = check_output("pass Mail/" + account, shell=True) \
        .splitlines()[0]
    return pass_output.decode("utf-8").strip()


if __name__ == "__main__":
    import sys
    if len(sys.argv) == 3:
        print(get_pass(sys.argv[1], sys.argv[2]))
    else:
        print(get_pass(sys.argv[1]))
