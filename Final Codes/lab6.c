#include <stdio.h>
#include <stdlib.h>


float Max_arr;
float Min_arr;

int Bucket_No;

struct Node {
  float data;
  struct Node *next;
};

struct Node *Insertion_Sort(struct Node *ptr) {
  // printf("Insertion sort called\n");
  struct Node *temp;
  struct Node * head = ptr; // Nlist

  if (head == NULL || head->next == NULL) {
    return ptr;
  }


  temp = head->next;
  head->next = NULL;

  while (temp != NULL) {

    struct Node *ptr = NULL;

    if ( head->data > temp->data) {

        struct Node *tmp = NULL;
        tmp = temp;
        temp = temp->next;
        tmp->next =head;
        head = tmp;
        continue;

    }

    for (ptr = head; ptr->next != NULL; ptr = ptr->next) {
      if (ptr->next->data > temp->data) break;
    }

    if (ptr->next != NULL) {

      struct Node *tmp;
      tmp = temp;
      temp = temp->next;
      tmp->next = ptr->next;
      ptr->next = tmp;
     
    } else {

      ptr->next = temp;
      ptr->next->next = NULL;
      temp = temp->next;
      
      

    }
  }
  return head;
}




int Index(float value) {
   int x  = (value-Min_arr)/(Max_arr-Min_arr)*Bucket_No;
    if(x>0) return x-1;
    else return 0;
}

void Bucket_Sort(float * arr, int p) {
  struct Node ** Bucket = NULL;
  Bucket = malloc(sizeof(struct Node *) * Bucket_No);

  for (int i = 0; i < Bucket_No; i++) {
    Bucket[i] = NULL;
  }

  for (int i = 0; i < p; i++) {

    int pos_ = Index(arr[i]);
    if(Bucket[pos_] == NULL){
        struct Node *ptr;
        ptr = malloc(sizeof(struct Node));
        ptr->data = arr[i];
        ptr->next = NULL;
        Bucket[pos_] = ptr;
    }else{
        struct Node *ptr;
        ptr = malloc(sizeof(struct Node));
        ptr->data = arr[i];
        ptr->next = Bucket[pos_];
        Bucket[pos_] = ptr;
    }

  }



  for (int i = 0; i < Bucket_No; i++) {
    Bucket[i] = Insertion_Sort(Bucket[i]);
  }

  int curr_index = 0;

  for (int i = 0; i < Bucket_No; i++) {
    struct Node *ptr = NULL;
    ptr = Bucket[i];
    while (ptr != NULL) {
      arr[curr_index] = ptr->data;
      curr_index++;
      ptr = ptr->next;
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
    float x = __INT_MAX__;
    for(int i =0 ;i<n;i++){
        if(arr[i]<x) x = arr[i];
    }
    return x;
}

void print(float * arr, int p) {
  for (int i = 0; i < p; ++i) {
    printf("%f ", arr[i]);
  }
  printf("\n");
}
int main(void) {
  int p, n;
  printf("Enter No of elements: \n");
  scanf("%d", &p);
  printf("Enter No. of Buckets: \n");
  scanf("%d", &Bucket_No);

  float arr[p];

  for(int i=0; i<p; i++){
    scanf("%f", &arr[i]);
  }

  Max_arr = max(arr,p);
  Min_arr = min(arr,p);

  Bucket_Sort(arr, p);

  print(arr, p);
  return 0;
}