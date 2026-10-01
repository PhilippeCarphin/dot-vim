#!/usr/bin/env python3

""" TODO: TEMPLATE PYTHON SCRIPT """

import argparse
import sys
import logging

class TODOError(Exception):
    pass

def get_args():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--debug", action='store_true', help="Turn on debug logging")

    args = p.parse_args()

    if args.debug:
        logger.setLevel(logging.DEBUG)

    return p.parse_args()

def main():
    args = get_args()

if __name__ == "__main__":
    if sys.stderr.isatty():
        logging.addLevelName( logging.WARNING, "\033[0;33m%s\033[0m" % logging.getLevelName(logging.WARNING))
        logging.addLevelName( logging.ERROR,   "\033[0;31m%s\033[0m" % logging.getLevelName(logging.ERROR))
        logging.addLevelName( logging.INFO,    "\033[0;35m%s\033[0m" % logging.getLevelName(logging.INFO))
        logging.addLevelName( logging.DEBUG,   "\033[0;36m%s\033[0m" % logging.getLevelName(logging.DEBUG))

    logger = logging.getLogger(__name__)
    FORMAT = "[TODO {levelname}] {message}"
    logging.basicConfig(format=FORMAT, style='{')
    logger.setLevel(logging.INFO)

    try:
        sys.exit(main())
    except MyProgError as e:
        logger.error(e)
        sys.exit(1)
    except KeyboardInterrupt:
        sys.exit(130)

