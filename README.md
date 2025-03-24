# 🧮 MIPS Assembly – Math Functions Suite

This directory contains MIPS assembly programs that demonstrate recursive, iterative, and function-based implementations of mathematical operations such as multiplication, exponentiation, and Fibonacci series.

---

## 📁 Files Overview

### 1. `mathFunction.asm` – Compound Function with Mult & Pow
Implements a custom mathematical function using:
- Manual multiplication (`Mult`) via repeated addition
- Exponentiation (`Pow`) via repeated multiplication
- A compound summation formula:  
  `f(a, n, x) = Σ (a - i) * x^i` for i from 0 to n

📌 **Concepts demonstrated:**
- Stack handling (`$sp`, `sw`, `lw`)
- Nested function calls
- Argument passing (`$a0`, `$a1`, `$a2`)

---

### 2. `exponentiation .asm` – Exponentiation with Custom Multiply
Computes:
- `a^n` using:
  - Manual `Mult` subroutine (repeated addition)
  - Iterative `Pow` with loop control

📌 **Concepts demonstrated:**
- Function-level arithmetic
- Loop-based power calculation
- Manual multiply function

---

### 3. `fibo.asm` – Recursive Fibonacci (Modified)
Computes a modified Fibonacci function:
- Uses parameters `n` and `x`
- Recursive relation:  
  `fib(y) = fib(y - 1) + fib(y - 2) * (x - 1)`  
  with base cases:  
  `fib(1) = 2`, `fib(2) = 3x + 5`

📌 **Concepts demonstrated:**
- Recursion with base case handling
- Stack preservation (`$ra`, `$s0`, `$s1`)
- Multiply inside recursive function

---

## 🔧 Requirements

- MIPS Simulator (e.g., [MARS](http://courses.missouristate.edu/kenvollmar/mars/) or SPIM)
- Basic understanding of:
  - Register conventions (`$a0`–`$a3`, `$v0`, `$ra`, `$sp`)
  - Stack frame layout
  - Syscall usage (input/output)

---

## 🚀 How to Run

1. Open any `.asm` file in your MIPS simulator.
2. Provide input values when prompted.
3. Run or step through to observe the output (typically printed using `syscall`).

---

## 🧪 Educational Goals

- Learn function implementation and stack discipline in MIPS
- Understand recursive vs. iterative logic
- Practice building compound math expressions at low level

---

## 📬 Contact

These programs are useful for learning MIPS architecture through mathematical logic.  
Feel free to reuse, modify, or extend them for educational or project use!
