#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int main() {
    int user_input;
    char buffer[100];
    
    scanf("%d", &user_input);
    
    int calculated_size = user_input + 10;  
    int multiple_size = user_input * 2;     
    int offset = user_input - 5;            
    int scaled_value = user_input / 2;      
    int remainder = user_input % 10;        
    
    int shifted = user_input << 2;         
    int right_shifted = user_input >> 1;   
    int bitwise_and = user_input & 0xFF;   
    int bitwise_or = user_input | 0x100;   
    int bitwise_xor = user_input ^ 0xF0F0; 
    
    int compound_value = (user_input + 5) * 2;
    int nested_op = ((user_input & 0xFF) << 2) + 10;
    
    // char *dynamic_buffer = (char *)malloc(calculated_size); // TODO: discuss
    
    memcpy(buffer, "Hello", multiple_size);  // sink!
    memset(buffer, 'A', offset);             // sink!
    
    char dest[50];
    char src[] = "this is a test string";
    strncpy(dest, src, bitwise_and);         // sink!
    
    char format_buffer[100];
    sprintf(format_buffer, "%d", compound_value);  // sink!
    
    fgets(buffer, 100, stdin);
    int manipulated_fd = atoi(buffer) + 10;   
    write(1, buffer, manipulated_fd);         // sink!
    
    return 0;
}