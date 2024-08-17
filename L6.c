#include <stdio.h>
#include <stdlib.h>

#define BUCKCAP 10  // Bucket capacity

struct Node {
  float data;
  struct Node *next;
};

struct Node *InsertSort(struct Node *list) {
  struct Node *k, *nodeList;
  if (list == 0 || list->next == 0) {
    return list;
  }
  nodeList = list;
  k = list->next;
  nodeList->next = 0;
  while (k != 0) {
    struct Node *ptr;
    if (nodeList->data > k->data) {
      struct Node *tmp;
      tmp = k;
      k = k->next;
      tmp->next = nodeList;
      nodeList = tmp;
      continue;
    }
    for (ptr = nodeList; ptr->next != 0; ptr = ptr->next) {
      if (ptr->next->data > k->data)
        break;
    }
    if (ptr->next != 0) {
      struct Node *tmp;
      tmp = k;
      k = k->next;
      tmp->next = ptr->next;
      ptr->next = tmp;
      continue;
    } 
    else {
      ptr->next = k;
      k = k->next;
      ptr->next->next = 0;
      continue;
    }
  }
  return nodeList;
}

void print(float ar[], int p) {
  int i;
  for (i = 0; i < p; ++i) {
    printf("%f ", ar[i]);
  }
  printf("\n");
}

void PrintBuckets(struct Node *list) {
  struct Node *cur = list;
  while (cur) {
    printf("%f ", cur->data);
    cur = cur->next;
  }
}

void BucketSort(float arr[], int p, int n) {
  int i, j;
  struct Node **buckets;
  buckets = (struct Node **)malloc(sizeof(struct Node *) * n);
  for (i = 0; i < n; ++i) {
    buckets[i] = NULL;
  }
  for (i = 0; i < p; ++i) {
    struct Node *current;
    int pos = arr[i]*n;
    current = (struct Node *)malloc(sizeof(struct Node));
    current->data = arr[i];
    current->next = buckets[pos];
    buckets[pos] = current;
  }

  for (i = 0; i < n; i++) {
    printf("B[%d]: ", i);
    PrintBuckets(buckets[i]);
    printf("\n");
  }

  for (i = 0; i < n; ++i) {
    buckets[i] = InsertSort(buckets[i]);
  }

  printf("\n");
  printf("Bucktets after sorting:\n");
  printf("\n");
  for (i = 0; i < n; i++) {
    printf("B[%d]: ", i);
    PrintBuckets(buckets[i]);
    printf("\n");
  }

  for (j = 0, i = 0; i < n; ++i) {
    struct Node *node;
    node = buckets[i];
    while (node) {
      arr[j++] = node->data;
      node = node->next;
    }
  }
  return;
}

int main(void) {
  int i, p, n;
  printf("Enter No. of Floating Point Integers(p):");
  scanf("%d", &p);
  printf("\nEnter No. of Buckets(n):");
  scanf("%d", &n);
  printf("\n");
  float array[p];
  for(i=0;i<p;i++){
    scanf("%f", &array[i]);
  }
  printf("\n");
  printf("Initial array: ");
  print(array,p);
  printf("\n");
  BucketSort(array, p, n);
  printf("\n");
  printf("Sorted array: ");
  print(array, p);
  return 0;
}