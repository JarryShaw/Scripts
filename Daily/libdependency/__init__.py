#!/usr/bin/python3
# -*- coding: utf-8 -*-


import os
import shlex
import subprocess


def _merge_packages(args):
    if 'package' in args and args.package:
        allflag = False
        package = set()
        for pkg in args.package:
            if allflag: break
            mapping = map(shlex.split, pkg.split(','))
            for list_ in mapping:
                if 'all' in list_:
                    package = {'all'}
                    allflag = True; break
                package = package.union(set(list_))
    else:
        package = {'all'}
    return package


def dependency_pip(args):
    pass


def dependency_brew(args):
    pass
