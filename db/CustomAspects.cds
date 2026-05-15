namespace poc.aspects;

aspect delete {
    DELETE : String enum {
        Yes = 'X';
        No = 'Y';
    } default 'X';
}
