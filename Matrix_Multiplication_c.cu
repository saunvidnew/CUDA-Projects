#include<stdio.h>
#include<stdlib.h>

void matrixMul(int* a, int* b, int *c, int n, int l) {
	int sum = 0;
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < l; j++) {
			for (int k = 0; k < n; k++) {
				sum += a[i*l+k ] * b[k*l+j ];

			}
			c[i*l+j] = sum;
			sum = 0;
		}
	}



}
int main() {
	int m, n, l, o;
	printf("Enter dimensions of matrix A:\n");
	scanf("%d %d", &m,&n);

	printf("Dimentions of matrix A: %d x %d \n", m, n);

	printf("Enter dimensions of matrix B: \n");
	scanf("%d %d", &l, &o);

	printf("Dimentions of matrix A: %d x %d \n", l, o);

	if (n != l) {
		printf("matrix multiplication is not possible");
		return 0;
	}
	
	int* A, * B,*C ;
	A = (int*)malloc(m * n * sizeof(int));
	B = (int*)malloc(l * o * sizeof(int));
	C = (int*)malloc(n * l * sizeof(int));

	printf("Enter the elements of matrix A: \n");
	for (int i = 0; i < m; i++) {
		for (int j = 0; j < n; j++) {
			printf("A[%d][%d]: ", i, j);
			scanf("%d", &A[i * n + j]);
		}
	}

	printf("Enter the elements of matrix B: \n");
	for (int i = 0; i < l; i++) {
		for (int j = 0; j < o; j++) {
			printf("B[%d][%d]: ", i, j);
			scanf("%d", &B[i * o + j]);
		}
	}


	matrixMul(A, B, C, n, l);

	printf("The resultant matrix is:\n");
	for (int i = 0; i < m; i++) {
		for (int j = 0; j < o; j++) {
			printf("%d ", C[i * o + j]);
		}
		printf("\n");
	}
	return 0;
}