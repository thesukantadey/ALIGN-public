import argparse
import pathlib
import logging
import json

from align.cell_fabric import generate_primitive

def main( args):
    logging.basicConfig(level=logging.getLevelName(args.logLevel))
    generate_primitive(
        args.block_name,
        args.primitive,
        args.pattern,
        args.height,
        args.nfin,
        args.Xcells,
        args.Ycells,
        args.params,
        args.pinSwitch,
        args.pdkdir,
        args.outputdir
    )

def gen_parser():
    parser = argparse.ArgumentParser( description="Inputs for Cell Generation")
    parser.add_argument( "-p", "--primitive", type=str, required=True)
    parser.add_argument( "-b", "--block_name", type=str, required=True)
    parser.add_argument( "-u", "--height", type=int, required=False, default=12)
    parser.add_argument( "-n", "--nfin", type=int, required=True)
    parser.add_argument( "-X", "--Xcells", type=int, required=True)
    parser.add_argument( "-Y", "--Ycells", type=int, required=True)
    parser.add_argument( "-s", "--pattern", type=int, required=False, default=1)
    parser.add_argument( "-q", "--pinSwitch", type=int, required=False, default=0)
    parser.add_argument( "--model", type=str, required=False, default=None)
    parser.add_argument( "--params", type=json.loads, required=False, default='{}')
    parser.add_argument( "-d", "--pdkdir", type=pathlib.Path, required=False, default=pathlib.Path(__file__).resolve().parent)
    parser.add_argument( "-o", "--outputdir", type=pathlib.Path, required=False, default=pathlib.Path.cwd().resolve() / 'Results')
    parser.add_argument( "-l", "--log", dest="logLevel", choices=['DEBUG','INFO','WARNING','ERROR','CRITICAL'], default='ERROR', help="Set the logging level (default: %(default)s)")
    return parser

if __name__ == "__main__":
    main( gen_parser().parse_args())
