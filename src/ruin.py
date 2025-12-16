#!/usr/bin/env python3
"""
Ruin Programming Language Interpreter
A simple interpreter for the Ruin programming language
"""

import sys

def main():
    """Main entry point for the Ruin interpreter"""
    if len(sys.argv) < 2:
        print("Ruin Programming Language Interpreter")
        print("Version: 0.1.0")
        print()
        print("Usage: python3 src/ruin.py <filename.ruin>")
        print("       python3 src/ruin.py --help")
        return
    
    if sys.argv[1] == "--help":
        print("Ruin Programming Language Interpreter")
        print("Version: 0.1.0")
        print()
        print("Usage:")
        print("  python3 src/ruin.py <filename.ruin>  Run a Ruin program")
        print("  python3 src/ruin.py --help           Show this help message")
        print()
        print("Examples:")
        print("  python3 src/ruin.py examples/hello_world.ruin")
        return
    
    filename = sys.argv[1]
    
    try:
        with open(filename, 'r') as f:
            code = f.read()
        
        print(f"Reading file: {filename}")
        print(f"File size: {len(code)} bytes")
        print()
        print("Note: Full interpreter implementation is in development.")
        print("This is a placeholder that demonstrates the basic structure.")
        
    except FileNotFoundError:
        print(f"Error: File '{filename}' not found")
        sys.exit(1)
    except Exception as e:
        print(f"Error: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()
