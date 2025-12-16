# Ruin Programming Language Specification

## Overview
Ruin is a simple, expressive programming language designed for general-purpose programming.

## Syntax

### Comments
```ruin
// Single-line comment
/* Multi-line 
   comment */
```

### Variables
```ruin
let x = 10;
let name = "Ruin";
let isActive = true;
```

### Functions
```ruin
func greet(name) {
    print("Hello, " + name);
}

func add(a, b) {
    return a + b;
}
```

### Control Flow
```ruin
// If statements
if (x > 10) {
    print("Greater than 10");
} else {
    print("Less than or equal to 10");
}

// While loops
while (x < 100) {
    x = x + 1;
}

// For loops
for (let i = 0; i < 10; i = i + 1) {
    print(i);
}
```

### Data Types
- **Numbers**: `42`, `3.14`
- **Strings**: `"hello"`, `'world'`
- **Booleans**: `true`, `false`
- **Arrays**: `[1, 2, 3, 4]`
- **Objects**: `{name: "John", age: 30}`

### Operators
- Arithmetic: `+`, `-`, `*`, `/`, `%`
- Comparison: `==`, `!=`, `<`, `>`, `<=`, `>=`
- Logical: `&&`, `||`, `!`

## Built-in Functions
- `print(value)` - Output to console
- `input(prompt)` - Read user input
- `len(collection)` - Get length of array or string
- `type(value)` - Get type of value

## Example Program
```ruin
// Calculate factorial
func factorial(n) {
    if (n <= 1) {
        return 1;
    }
    return n * factorial(n - 1);
}

let result = factorial(5);
print("Factorial of 5 is: " + result);
```

## Future Features
- Object-oriented programming
- Modules and imports
- Error handling
- Standard library expansion
