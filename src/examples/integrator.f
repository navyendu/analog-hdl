include "lib.f"

component opamp<ninv, inv, com, out>(Av, Zi, Zo)
{
    current<ninv> = - current<inv>;
    
    current<ninv> = voltage<ninv, inv> / Zi;
    
    voltage<out, com> = Av * voltage<ninv, inv> + Zo * current<out>;
}

main
{
    node n1, n2, n3;
    
    vdc             Vs  <n1 , gnd>          (5);
    resistor        R   <n1 , n2>           (1e3);
    capacitor       C   <n2 , n3>           (1e-6, 0);
    opamp           A1  <gnd, n1, gnd, n3>  (1e6, 2e6, 100);
}
