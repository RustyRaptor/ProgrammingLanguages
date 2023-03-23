function sub1() {
        let x: number;
        
        function sub2() {
                console.log(x);                
        }
        function sub3() {
                let x: number;
                x = 3;

                sub4(sub2);
        }

        function sub4(subx: Function) {
                let x: number;
                x = 4;
                subx();
        }

        x = 1;
        sub3();
}

sub1();