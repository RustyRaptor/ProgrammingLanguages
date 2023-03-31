// Main function to test the binding behavior in JavaScript
function sub1() {
        // Declare variable x in the scope of sub1
        let x;
    
        // Nested function sub2, which logs the value of x to the console
        function sub2() {
            console.log(x);
        }
    
        // Nested function sub3, which creates a new local variable x,
        // assigns it a value, and calls sub4 with sub2 as an argument
        function sub3() {
            let x;
            x = 3;
            sub4(sub2);
        }
    
        // Nested function sub4, which creates a new local variable x,
        // assigns it a value, and calls the passed-in function (subx)
        function sub4(subx) {
            let x;
            x = 4;
            subx();
        }
    
        // Assign a value to the variable x declared in sub1's scope
        x = 1;
        // Call sub3
        sub3();
    }
    // Call sub1
    sub1();
    