from subprocess import check_output


def get_pass(account):
    return check_output("pass Mail/" + account, shell=True).splitlines()[0]


if __name__ == "__main__":
    import sys
    print(get_pass(sys.argv[1]))
