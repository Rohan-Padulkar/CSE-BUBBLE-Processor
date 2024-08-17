// Module 4-to-1 multiplexer. Port list is taken exactly from
// the 1/0 diagram.
module mux(out, iO, il, i2, i3, sl, SO);
    // Port declarations from the 1/0 diagram
    output out;
    input iO, il, i2, i3;
    input sl, SO;
    // Internal wire declarations
    wire sln, son;
    wire yO, yl, y2, y3;
    // Gate instantiations
    // Create sln and son signals.
    not (sln, sl) ;
    not (son, SO);
    // 3-input and gates instantiated
    and (yO, iO, sln, son);
    and (yl, il, sln, so);
    and (y2, i2, sl, son);
    and (y3, i3, sl, SO);
    // 4-input or gate instantiated
    or (out, yO, yl, y2, y3);
endmodule