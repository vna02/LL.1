#include<iostream>
using namespace std;

class node {
    public:
    int val;
    node*next;
    node(int newval) {
         val=newval;
        next=NULL;
    }
};

class linkedlist {
    public:
    node*head;
    linkedlist () {
        head=NULL;
    }
    //insert function
    void insert (int newval) {
        node*temp=new node(newval);
        temp->next=head;
        head=temp;
    }
    void display (){
        node*current=head;
        while(current != NULL) {
            cout<<current->val<< "->";
            current=current->next;
        }
        cout<<"NULL"<<endl;
    }
   
    int numofitems () {
        int count=0;
        node*current=head;
        while (current != NULL) {
            count++;
            current=current->next;
        }
    return count;
    }

    node*getpos(int pos) {   
         int cnt =0;
         node*current=head;
         while (cnt<(pos-1)) {
              current=current->next;
              cnt++;
         }
         return current;
     }   

    void insertat (int newval, int pos) {
        //if count is more than position+1       
        if (pos<1||pos > (numofitems()+1) ){
            cout<<"The code won't be valid"<<endl;
            return;
        }
        //reach to pos-1
        node*current= getpos(pos-1);
         if (pos==1){
            insert (newval);
        }
        else {
            node*temp=new node(newval);
            temp->next=current->next;
            current->next=temp;
        }
    }

    void delet () {
        node*temp=head;
        head=head->next;
        delete temp;
    }

    void deleteat (int pos) {
        if (pos > (numofitems())) {
            cout<<"The code won't be valid"<<endl;
            return;
        }
         node*current=getpos(pos-1);
        if (pos==1) {
            delet ();
        }
        else {
            node*temp=current->next;
            current=temp->next;
            delete temp;
        }
    }
   
   
   
};
int main () {
    linkedlist l1;
    for (int b=0; b < 20; b++) {
        l1.insert(b);
    }
    l1.display();
    cout<<"number of items : " <<l1.numofitems()<<endl;
    cout<<l1.getpos(20)->val<<endl;
    l1.insertat(21, 21);
    l1.display();
    l1.insertat(4, 3);
     l1.display();
     l1.delet();
     l1.deleteat(10);


   
return 0;
}
