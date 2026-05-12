# RV-Sparse: CSR Sparse Matrix-Vector Multiply

## Challenge

Implement `sparse_multiply` that:
1. Scans a row-major matrix `A` and identifies its non-zero elements.
2. Extracts them into Compressed Sparse Row (CSR) format using caller-provided buffers.
3. Computes the matrix-vector product `y = A * x` using the extracted CSR data.

**Constraint:** Zero dynamic memory allocation — all buffers are pre-allocated by the caller.

## Implementation

The function operates in two phases:

- **Phase 1 (CSR construction):** Iterates `A` row by row. For each non-zero, stores the value in `values[]` and its column index in `col_indices[]`. After each row, records the cumulative count in `row_ptrs[]`.
- **Phase 2 (multiply):** For each row `i`, iterates over `values[k]` for `k` in `[row_ptrs[i], row_ptrs[i+1])` and accumulates `values[k] * x[col_indices[k]]` into `y[i]`.

## Build & Run

```sh
make
./run
```

Or manually:

```sh
gcc -Wall -Wextra -O2 -lm -o run challenge.c
./run
```
