#include<stdio.h>

long boyer_moore(long n, long* nums);

// long boyer_moore(long n, long* nums){
//     long count = 0;
//     long counted = nums[0];
//     for(long i =0;i<n;i++){
//         if(counted==nums[i]) count++;
//         else count--;

//         if(count==0){
//             count++;
//             counted = nums[i];
//         }
//     }
//     return counted;
// }

int main(){
    long n;
    scanf("%ld",&n);
    long nums[n];
    for(long i = 0;i<n;i++){
        scanf("%ld",&nums[i]);
    }
    printf("%ld\n",boyer_moore(n,nums));
    return 0;
}