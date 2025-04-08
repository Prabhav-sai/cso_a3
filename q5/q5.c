#include<stdio.h>

short peak(int n, short* rooms);

// long peak(long n, long* rooms){
//     if(n==1) return rooms[0];
//     if(rooms[0]>=rooms[1]) return rooms[0];
//     if(rooms[n-1]>=rooms[n-2]) return rooms[n-1];
//     long l =0;
//     long r = n-1;
//     long mid = 0;
//     while(l<r){
//         mid = (r-l)/2 + l;
//         if(rooms[mid] < rooms[mid+1]){
//             l = mid+1;
//         }
//         else{
//             r = mid;
//         }
//     }
//     return rooms[l];
// }

int main(){
    int n;
    scanf("%d",&n);
    short rooms[n];
    for(int i = 0;i<n;i++){
        scanf("%hd",&rooms[i]);
    }
    printf("%hd\n",peak(n,rooms));
    return 0;
}