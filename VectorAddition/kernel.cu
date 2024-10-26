#include<stdio.h>
#include<stdlib.h>
#include<cuda_runtime.h>
__global__ void vecAdd(int *A, int *B, int *C, int n) {
	
	int i = threadIdx.x;

	if (i < n) {
		C[i] = A[i] + B[i];
	}
	
		

}

int main() {
	int *A, *B, *C;
	int n=4;
	cudaMallocManaged(&A, n * sizeof(int));
	cudaMallocManaged(&B, n * sizeof(int));
	cudaMallocManaged(&C, n * sizeof(int));

	for (int i = 0; i < n; i++) {
		A[i] = i;
		B[i] = i;
		C[i] = 0;
	}

	vecAdd<<<1,n>>> (A, B, C,n);
	cudaDeviceSynchronize();

	for (int i = 0; i < n; i++) {
		printf("C[%d]=%d \n", i, C[i]);

	}
	cudaFree(A);
	cudaFree(B);
	cudaFree(C);

	return 0;



}