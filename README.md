# A language to describe analog circuits

This work was performed as part of my B. Tech project (https://github.com/navyendu/accel). Rights may be owned by my university.

This is initial revision, as-is, developed in 2009. May undergo changes in future.

# Syntax

## Keywords

### `component`
Describes an cicruit component with multiple leads, such as resistor, capacitor or amplifier. Values enclosed in angle brackets indicate lead names while parantheses indicate values that associate with the component, such as resistance or amplification factor. Curly braces are used to group the equations that govern the component

### `main`
Top level circuit

### `node`
Describes a node in the circuit

### `probe`
Indicates a node to be probed during simulation. Might be deprecated in future

## operators

### `voltage<lead1, lead2>`
Indicates the voltage of `lead1` with `lead2` as the reference

### `current<lead>`
Indicates the current entering the component via `lead1`

### `diff(voltage|current, initial_value)`
Indicates a derivative operation in time of a quantity, which could be a voltage or a current. `initial_value` indicates the value of the quantity at start of simulation

# Example

    component vdc < t0, t1> ( V )
    {
        voltage <t0, t1> = V;
    }
    
    component resistor < t0, t1> ( R )
    {
        voltage <t0, t1> = current <t0> * R;
    }
    
    component capacitor <t0, t1> ( C , V0 )
    {
        current <t0> = C * diff( voltage<t1, t2> , V0);
    }
    
    main
    {
        node        n1, n2, n3;
        
        vdc         < n1, gnd>  Vs  ( 5 );
        resistor    < n1, n3>   R1  ( 1e3 );
        capacitor   < n3, n2>   C1  ( 23, 8);
        resistor    < n2, gnd>  R2  ( 2e3 );
        capacitor   < n2, gnd>  C   ( 1e-6, 2);
        
        probe       voltage <n2, gnd>;
        probe       current <R1.t0>;
        probe       current <R2.t0>;
        probe       current <C.t0>;
    }
