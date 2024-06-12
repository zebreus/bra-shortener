// Width of the three big holes in mm
holeWidth = 18; // [1:50]
// The height of the upper and lower hole in mm
holeHeight = 4; // [0.4:20]
// The width of the arms in mm
frameWidth = 3; // [1:10]
// The thickness of the part in mm
thickness = 1.7; // [0.5:5]
// The size of the two openings in mm
openingWidth = 8; // [1:40]
// The height of the middle hole in mm
centerHeight = 4; // [0.4:20]

module copy_mirror(vec)
{
    children();
    mirror(vec) children();
}

translate([ 0, -centerHeight / 2, 0 ]) cube([ frameWidth, centerHeight, thickness ]);

copy_mirror([ 0, 1, 0 ]) translate([ 0, -(holeHeight + frameWidth * 2 + centerHeight / 2), 0 ]) union()
{

    translate([ 0, frameWidth + holeHeight, 0 ]) cube([ holeWidth + frameWidth * 2, frameWidth, thickness ]);

    render() difference()
    {
        cube([ holeWidth + frameWidth * 2, frameWidth, thickness ]);
        translate([ frameWidth + ((holeWidth - openingWidth) / 2), 0, 0 ])
            cube([ openingWidth, frameWidth, thickness ]);
    }
    for (i = [ 0, frameWidth + holeWidth ])
        translate([ i, 0, 0 ]) cube([ frameWidth, holeHeight + frameWidth * 2, thickness ]);
}
