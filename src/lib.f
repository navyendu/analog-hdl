component vdc<n1, n2> (V)
{
    voltage<n1, n2> = V;
}

component idc<n1, n2> (I)
{
    current<n1> = -I;
}

component resistor<n1, n2> (R)
{
    voltage<n1, n2> = R * current<n1>;
}

component conductor<n1, n2> (G)
{
    current<n1> = G * voltage<n1, n2>;
}

component capacitor<n1, n2> (C, V0)
{
    current<n1> = C * diff(voltage<n1, n2>, V0);
}

component inductor<n1, n2> (L, I0)
{
    voltage<n1, n2> = L * diff(current<n1>, I0);
}

component vcvs<in1, in2, out1, out2> (AV)
{
    current<in1> = 0;
    current<in2> = 0;
    voltage<out1, out2> = AV * voltage<in1, in2>;
}

component vccs<in1, in2, out1, out2> (AG)
{
    current<in1> = 0;
    current<in2> = 0;
    current<out1> = - AG * voltage<in1, in2>;
}

component ccvs<in1, in2, out1, out2> (AR)
{
    voltage<in1, in2> = 0;
    voltage<out1, out2> = AR * current<in1>;
}

component cccs<in1, in2, out1, out2> (AI)
{
    voltage<in1, in2> = 0;
    current<out1> = - AI * current<in1>;
}

component amplifier<in, com, out> (A, Zi, Zo)
{
    current<in> = voltage<in, com> / Zi;
    voltage<out, com> = A * voltage<in, com> + Zo * current<out>;
}

component buffer<in, com, out> (A)
{
    current<in> = 0;
    voltage<out, com> = A * voltage<in, com>;
}
