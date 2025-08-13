%{
#include <stdio.h>
#include <string.h>
#include <stdbool.h>


bool validarG1(const char *pal, int len) {
    if (len==1) return pal[0]=='0' || pal[0]=='1';
    if (len<1) return false;
    if ((pal[0]=='0' || pal[0]=='1') && pal[0]==pal[len-1]) {
        if (len==2) return true;
        return validarG1(pal+1, len-2);
    }
    return false;
}

bool validarG2(const char *pal, int len) {
    int i=0;
    while (i<len && pal[i]=='a') i++;
    int n_a=i;
    int n_b=len-n_a;
    if (n_b != n_a + 1) return false;
    for (int j=n_a; j<len; j++) if (pal[j]!='b') return false;
    return true;
}

bool validarG3(const char *pal, int len) {
    int i=0;
    while (i<len && pal[i]=='a') i++;
    if (i == 0) return false;
    int n_b=len-i;
    if (n_b !=i+1) return false;
    for (int j=i; j<len; j++) if (pal[j]!='b') return false;
    return true;
}

bool validarG4(const char *pal, int len) {
    if (len==1 && pal[0]=='ab') return true;
    if (len==3 && strncmp(pal, "abb", 3)== 0) return true;
    return false;
}

bool validarG5(const char *pal, int len) {
    if (len<2) return false;
    if (pal[0]!='a' || pal[len-1]!='b') return false;
    for (int i=1; i<len-1; i+=2) {
        if (i+1>=len-1) return false;
        if (pal[i]!='a' || pal[i+1]!='b') return false;
    }
    return true;
}

bool validar(const char *pal) {
    int len=strlen(pal);
    if (validarG1(pal, len)) return true;
    if (validarG2(pal, len)) return true;
    if (validarG3(pal, len)) return true;
    if (validarG4(pal, len)) return true;
    if (validarG5(pal, len)) return true;
    return false;
}
%}

%%
.*\n {
    // quitar salto de línea
    int len = yyleng;
    while(len>0 && (yytext[len-1]=='\n' || yytext[len-1]=='\r')) len--;

    char palabra[256];
    if (len>255) len=255;
    strncpy(palabra, yytext, len);
    palabra[len]='\0';

    if (len==0) { /* línea vacía, ignorar */ }
    else if (validar(palabra)) printf("Acepta\n");
    else printf("No acepta\n");
}

%%
int main(int argc, char **argv) {
    if (argc>1) {
        FILE *f=fopen(argv[1], "r");
        if (!f) {
            perror("Error al abrir archivo");
            return 1;
        }
        yyin=f;
    }
    yylex();
    return 0;
}
