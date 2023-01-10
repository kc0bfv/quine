    for( int i = 0; i < sizeof(p) - 1; i++ ) {
        if( p[i] == 0x7c ) {
            printf("%s", p);
        } else if( p[i] == 0x5e ) {
            printf("\n");
        } else if( p[i] == 0x24 ) {
            printf("%c", 0x5c);
        } else if( p[i] == 0x40 ) {
            printf("%c", 0x22);
        } else {
            printf("%c", p[i]);
        }
    }

    return 0;
}
