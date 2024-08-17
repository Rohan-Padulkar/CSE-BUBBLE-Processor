#include <stdio.h>
#include <stdlib.h>

#define INTERVAL 10  // Each bucket capacity
float Max_arr;
float Min_arr;


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
    } else {
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


int Index(float value, int n) {
   int x  = (value-Min_arr)/(Max_arr-Min_arr)*n;
    if(x>0) return x-1;
    else return 0;
}

void BucketSort(float * arr, int p, int n) {
  struct Node **buckets;
  buckets = malloc(sizeof(struct Node *) * n);

  for (int i = 0; i < n; ++i) {
    buckets[i] = NULL;
  }

  for (int i = 0; i < p; ++i) {

    struct Node *ptr;
    ptr = malloc(sizeof(struct Node));
    int pos = Index(arr[i], n);
    ptr->data = arr[i];
    ptr->next = buckets[pos];
    buckets[pos] = ptr;

  }



  for (int i = 0; i < n; ++i) {
    buckets[i] = InsertSort(buckets[i]);
  }


  for (int j = 0, i = 0; i < n; ++i) {
    struct Node *temp;
    temp = buckets[i];
    while (temp != NULL) {
      arr[j++] = temp->data;
      temp = temp->next;
    }
  }

  return;
}

float max(float * arr, int n){
    float x = -1;
    for(int i =0 ;i<n;i++){
        if(arr[i]>x) x = arr[i];
    }
    return x;
}

float min(float *arr,int n){
    float x = INT_MAX;
    for(int i =0 ;i<n;i++){
        if(arr[i]<x) x = arr[i];
    }
    return x;
}

int main(void) {
  int p, n;
  printf("Enter No of Flaoting Point No: \n");
  scanf("%d", &p);
  printf("Enter No. of Buckets(n): \n");
  scanf("%d", &n);

  float arr[p];

  for(int i=0;i<p;i++){
    scanf("%f", &arr[i]);
  }

  Max_arr = max(arr,p);
  Min_arr = min(arr,p);

  BucketSort(arr, p, n);
  printf("Sorted array: ");
  print(arr, p);
  return 0;
}