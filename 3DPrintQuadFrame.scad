// 3D printable mini Quadcopter frame
// Licensed under a Creative Commons Attribution License
// Matt Holmes, matt@mjholmes.org - May 2015

$fn=100;

// Some definitions
TopPieceThickness = 2.5;
BottomPieceThickness = 2.5;

MountingHoleDia = 3.0; // Dia of mounting holes for Flight contr
FCMountingCentres = 30.5; // Mounting hole centres for Flight contr

ArmDia = 8.0;
ArmLength = 70.0;
ArmMountingCubeHoleDia = ArmDia + 0.1;
ArmMountingCubeLength = 20;
ArmMountingCubeWallThickness = 1.0;
ArmMountingCubeTopRecess = 1.0;

BatteryStrapSlotWidth = 3.0;
BatteryStrapSlotLength = 12.0;
BatteryWidth = 35.0;

MMountDia = 25.0;
MMountFixingCentres = 15.5;
MMountHoleDia = 2.5;
MMountThickness = 3.0;

LGearLength = 45.0;


// Uncomment the bits you want to print or all of them
// to see a fully rendered model

//translate([0, 0, BottomPieceThickness + ArmMountingCubeVisibleHeight])
//      top_piece();

//bottom_piece();

//for ( i = [0 : 3] ) {
//    rotate( i * 360 / 4) {
//        motor_arm();
//    }
//}

//for ( i = [0 : 3] ) {
//    rotate( i * 360 / 4) {
//        translate([120,0,12])
//          rotate([180,0,180])
            motor_mount();
//    }
//}

///////////////////////////////////////////////////////
// Defs below arent usefully tweakable
TopInnerCutoutDia = 30; // Centre hole in the top piece

BodyOuterDia = 50;
BodySpokeLength = 45;
BodySpokeOuterDia = 15;
BodySpokeInternalDia = 35;


ArmMountingCubeVisibleHeight = ArmMountingCubeHoleDia + ArmMountingCubeWallThickness*2;
ArmMountingCubeHeight = ArmMountingCubeVisibleHeight + ArmMountingCubeTopRecess;
ArmMountingCubeWidth = ArmMountingCubeVisibleHeight;


// distance from edge of arm circular end to start of cube
ArmMountingCubeEdgeOffset = 1.0;

LGearMountingCubeWidth = 12.0;
LGearMountingCubeDepth = 12.0;
LGearMountingCubeHeight = 10.0;

LGearWidth = 6.0;
LGearDepth = 6.0;
LGearFudgeFactor = 2.0;
LGearWallThickness = 1.5;

///////////////////////////////////////////////////////
// Modules
module top_piece () {
difference(){
    linear_extrude(height=TopPieceThickness){
    difference(){
        union(){
            hull(){
                translate([0, BodySpokeLength, 0])
                    circle(d=BodySpokeOuterDia, center=true);
                circle(d=BodySpokeInternalDia, center=true);
                translate([0, -BodySpokeLength, 0])
                    circle(d=BodySpokeOuterDia, center=true);
            }
            hull(){
                translate([BodySpokeLength, 0, 0])
                    circle(d=BodySpokeOuterDia, center=true);
                circle(d=BodySpokeInternalDia, center=true);
                translate([-BodySpokeLength, 0, 0])
                    circle(d=BodySpokeOuterDia, center=true);
            }
            circle(d=BodyOuterDia);
        }

        // Cut out 2x4 30.5mm mounting holes for X and + config
        for ( i = [0 : 7] ) {
            rotate( i * 360 / 8) {
                translate([0,sqrt(2*pow(FCMountingCentres/2,2)),0])
                    circle(d=MountingHoleDia);
            }
        }

    
        // cut our a centre hole for wires
        circle(d=TopInnerCutoutDia);
    }
}

// Cut recess for mating arm cubes (0.1mm bigger)
// Set back from end of spoke by 1mm
    for ( i = [0 : 3] ) {
        rotate( i * 360 / 4) {
            translate([0,
                       BodySpokeLength
                         - ArmMountingCubeLength/2
                         + sqrt(pow(BodySpokeOuterDia/2,2)
                                -pow(ArmMountingCubeWidth/2,2))
                         - ArmMountingCubeEdgeOffset,
                        -ArmMountingCubeHeight/2
                          +ArmMountingCubeTopRecess])
                cube([ArmMountingCubeWidth + 0.1,
                      ArmMountingCubeLength + 0.1,
                      ArmMountingCubeHeight + 0.1], center=true);
        }
    }

}
}

module bottom_piece() {
union(){
    linear_extrude(height=BottomPieceThickness){
    difference(){
        union(){
            hull(){
                translate([0, BodySpokeLength, 0])
                    circle(d=BodySpokeOuterDia, center=true);
                circle(d=BodySpokeInternalDia, center=true);
                translate([0, -BodySpokeLength, 0])
                    circle(d=BodySpokeOuterDia, center=true);
            }
            hull(){
                translate([BodySpokeLength, 0, 0])
                    circle(d=BodySpokeOuterDia, center=true);
                circle(d=BodySpokeInternalDia, center=true);
                translate([-BodySpokeLength, 0, 0])
                    circle(d=BodySpokeOuterDia, center=true);
            }
            circle(d=BodyOuterDia);
        }
        // cut out stuff goes here
        rotate (45) hull(){ // battery strap slot 1
            translate([-BatteryStrapSlotLength/2,BatteryWidth/2,])
              circle(d=BatteryStrapSlotWidth);
            translate([BatteryStrapSlotLength/2,BatteryWidth/2,])
              circle(d=BatteryStrapSlotWidth);
        }
        rotate(45) hull(){ // battery strap slot 2
            translate([-BatteryStrapSlotLength/2,-BatteryWidth/2,])
              circle(d=BatteryStrapSlotWidth);
            translate([BatteryStrapSlotLength/2,-BatteryWidth/2,])
              circle(d=BatteryStrapSlotWidth);
        }
        
        for ( i = [0 : 3] ) { // ESC cable entry points
            rotate( i * 360 / 4) 
                translate([0,27,0])
                    hull() {
                        translate([3.5,0,0]) circle(d=2.5, center = true);
                        translate([-3.5,0,0]) circle(d=2.5, center = true);
                    }
        }   
    } // end base plate difference
}
    // Add arm mounting cubes
    for ( i = [0 : 3] ) {
        rotate( i * 360 / 4) {
            translate([0,
               BodySpokeLength
                 - ArmMountingCubeLength/2
                 + sqrt(pow(BodySpokeOuterDia/2,2)
                        -pow(ArmMountingCubeWidth/2,2))
                 - ArmMountingCubeEdgeOffset,
               ArmMountingCubeHeight/2
                 +BottomPieceThickness])
            difference(){
               cube([ArmMountingCubeWidth,
                    ArmMountingCubeLength,
                    ArmMountingCubeHeight],
                    center=true);
               translate([0,0,-ArmMountingCubeTopRecess])
                    rotate([90,0,0])
                       cylinder(d = ArmMountingCubeHoleDia, 
                                h = ArmMountingCubeLength + 2,
                                center = true);
            }
        }
    } // end arm cubes
}
}
module motor_arm() {
                   translate([0,
                              ArmLength/2 + BodySpokeLength
                                - ArmMountingCubeLength
                                + sqrt(pow(BodySpokeOuterDia/2,2)
                                    -pow(ArmMountingCubeWidth/2,2))
                                - ArmMountingCubeEdgeOffset,
                              BottomPieceThickness
                                + ArmMountingCubeVisibleHeight/2])
                    rotate([90,0,0])
                       cylinder(d = ArmDia, 
                                h = ArmLength,
                                center = true);
}
module motor_mount () {
    linear_extrude(height=MMountThickness){
    difference(){
        hull() {
            circle(d=MMountDia);
            translate([MMountDia/2 + LGearMountingCubeDepth/2
                                   - LGearFudgeFactor,
                       0,
                       0])
              square([LGearMountingCubeDepth,LGearMountingCubeWidth],
                     center=true);
        }
        for ( i = [0 : 3] ) { // motor mounting holes
            rotate( i * 360 / 4 + 45) {
                translate([0,MMountFixingCentres/2,0])
                    circle(d=MMountHoleDia);
            }
        }
        circle(d=5); // centre cutout
        for ( i = [0 : 3] ) { // triangle cutouts
            rotate( i * 360 / 4) {
                hull() {
                    translate([-2,9,0]) circle(d=2);
                    translate([2,9,0]) circle(d=2);
                    translate([0,4.5,0]) circle(d=2);
                }
            }
        }
    }

}
    difference() { // arm moutning cube
        translate([LGearMountingCubeDepth/2 + MMountDia/2
                     - LGearFudgeFactor,
                  0,
                  MMountThickness+LGearMountingCubeHeight/2])
          cube([LGearMountingCubeWidth,
                LGearMountingCubeDepth,
                LGearMountingCubeHeight],
                center=true);
        
        
        translate([LGearMountingCubeDepth/2 +MMountDia/2
                     - LGearFudgeFactor,
                   0,
                   LGearMountingCubeHeight/2
                     + MMountThickness])
          rotate([0,90,0])
            cylinder(d = ArmMountingCubeHoleDia, 
                     h = LGearMountingCubeDepth + 1,
                     center = true);
    }
    
    
    difference(){ // landing gear (extention of cube)
        translate([LGearMountingCubeDepth/2+MMountDia/2
                   - LGearFudgeFactor,
                   0,
                   LGearLength/2 + MMountThickness
                     + LGearMountingCubeHeight])
          cube([LGearWidth,LGearDepth,LGearLength], center=true);
        translate([LGearMountingCubeDepth/2+MMountDia/2
                     - LGearFudgeFactor,
                   0,
                   LGearLength/2 + MMountThickness
                     + LGearMountingCubeHeight +1])
          cube([LGearWidth - 2*LGearWallThickness,
                LGearDepth - 2*LGearWallThickness,
                LGearLength], center=true);
    }
}