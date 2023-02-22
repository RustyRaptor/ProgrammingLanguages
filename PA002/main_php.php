<?php

// Function that prints a string when we don't have short-circuit evaluation.
function print_answer() {
    echo "We DO NOT have short-circuit evaluation!\n";
    return true;
}

//  Set A to false
$A = false;

// f they are both true print that they are both true
// Else print a string to helpdetermine if w have short circuit evaluation.
if ($A && print_answer()) {
    echo "Both A and B are true\n";
} else {
    echo "If you only see this then we DO have short circuit evaluation\n";
}
