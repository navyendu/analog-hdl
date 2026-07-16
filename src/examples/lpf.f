include "lib.f"

component lpf<in, com, out>
{
    resistor <in, out> (1e+3);
    capacitor <out, com> (1e-6, 0);
    resistor <out, com> (2e+3);
}

main
{
    node no1, no2;
    
    vdc V1 <no1, gnd> (5);
    lpf x1 <no1, gnd, no2>;
}
