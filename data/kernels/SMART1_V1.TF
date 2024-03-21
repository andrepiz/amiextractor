KPL/FK

******************************************************************************

IN THIS KERNEL, THE ROTATION ANGLES ABOUT X AND Y FOR THE AMIE CCD FRAME
ARE THE NEGATIVE OF THOSE IN VERSION 0.9

******************************************************************************


SMART-1 Spacecraft Frames Kernel
========================================================================

   This frame kernel contains the complete set of frame definitions for 
   the SMART-1 Spacecraft (SMART-1) including definitions for the 
   SMART-1 spacecraft and SMART-1 science instrument frames. This kernel 
   also contains NAIF ID/name mapping for the SMART-1 instruments.


Version and Date
========================================================================

   Version 0.9 -- April 19, 2007 -- Jose Luis Vazquez , RSSD/ESA
  
      Updated after discussion within RSSD AMIE team (Bjoern Grieger, 
      Detlef Koschny, J. Vazquez). See S1-AMIE-RSSD-TN-008 for details.
      
      Corrections made on AMIE frames. Position of the X and Y filters
      swapped on the figure, and rotation angles corrected. Corrected AMIE
      frame (SMART_AMIE_CCD) specification. 
     
      Updated the AMIE frames description.  

   Version 0.8 -- November 28, 2005 -- Jorge Diaz del Rio, RSSD/ESA

      Solar Panels' corner points name/ID pairs included. For each
      of the solar panels, 4 corner point name/ID pairs are defined:
       SMART1_SA+Y_C1, SMART1_SA+Y_C2, SMART1_SA+Y_C3, SMART1_SA+Y_C4,
       SMART1_SA-Y_C1, SMART1_SA-Y_C2, SMART1_SA-Y_C3, SMART1_SA-Y_C4.
      Typo corrected in the SPEDE instrument names

   Version 0.7 -- November 18, 2005 -- Jorge Diaz del Rio, RSSD/ESA
    
      Correction of the rotation angles of the SMART1_XSM frame
      definition after email sent by  Jyri Naranen (XSM team). The
      nominal values from Version 0.3 of this frame have been included
      again.

   Version 0.6 -- June 17, 2005 -- Jorge Diaz del Rio, RSSD/ESA

      Corrections in the D-CIXS diagram proposed by D-CIXS team.

   Version 0.5 -- May 27, 2005 -- Jorge Diaz del Rio, RSSD/ESA
 
      Reorganization of D-CIXS frame names and tree. DCIXS_BASE renamed
      to DCIXS. DCIXS_FACET1, DCIXS_FACET2, DCIXS_FACET3 removed from the
      DCIXS frame tree. Information about facet's boresights is provided
      in the SMART1/D-CIXS IK. 

   Version 0.4 -- April 20, 2005 -- Jorge Diaz del Rio, RSSD/ESA
   
      Correction of the rotation angles of the SMART1_XSM frame
      definition after the review of XSM Instrument Team.

   Version 0.3 -- March 10, 2005 -- Jorge Diaz del Rio, RSSD/ESA
      
      Solar Array BAPTA frames included. Corrections to the instrument
      frames alignment values applied. Preliminary Version. Pending
      review and approval by SMART-1 instrument teams.

   Version 0.2 -- January 20, 2005 -- Jorge Diaz del Rio, RSSD/ESA

      SPEDE frames added. Preliminary Version. Pending review and
      approval by SMART-1 instrument teams and ESTEC Science Operations
      Team.

   Version 0.1 -- January 06, 2005 -- Jorge Diaz del Rio, RSSD/ESA

      D-CIXS, XSM frames added. Preliminary Version. Pending review
      and approval by SMART-1 instrument teams and ESTEC Science
      operations team.
  
   Version 0.0 -- December 10, 2004 -- Jorge Diaz del Rio, RSSD/ESA

      Preliminary Version. Pending review and approval by SMART-1 
      instrument teams and ESTEC Science operations team.

References
========================================================================

   1. ``Frames Required Reading''

   2. ``Kernel Pool Required Reading''

   3. ``C-Kernel Required Reading''

   4. Experiment Interface Document - Part A (EID-A), Issue 4
      Doc.: S1-EST-EID-3 001, 17-April-2001

   5. AMIE boresight analysis D/- (28-Oct-2004). S1-AMIE-RSSD-TN-004

   6. AMIE Flight User Manual Issue 2.1 (30-Jan-2004). S1-AMI-MA-3001  

   7. AMIE-SIR Co-Alignment analysis Issue 1/c (24-Oct-2004).
      S1-AMIE-RSSD-TN-003

   8. DCIXS/XSM User Manual Issue 7 (27-Mar-2003). S1-CIX-MA-3002

   9. BAPTA potentiometer and SA positions. (06-Dec-2001)
      S1-MEC-BAPTA-TN-22 

  10. Solar Array ICD, Issue 4. October 2001. S1-FS-IC-001/S1-FKS-ICD-2049

  11. BAPTA Technical Description, Issue 0, (16-May-2000). FS00131731

  12. Email from J. De Bruin (SMART-1 Flight Control Team), 18-Feb-2005
 
  13. SMART-1 AMIE Frame and clock kernel tests, S1-AMIE-RSSD-TN-008
      Bjoern Grieger.

Contact Information
========================================================================

   Jose Luis Vazquez, RSSD/ESA, +34 91 8131 310, jlvazquez@sciops.esa.int


Implementation Notes
========================================================================

   This file is used by the SPICE system as follows: programs that make
   use of this frame kernel must 'load' the kernel, normally during
   program initialization. The SPICELIB routine FURNSH and CSPICE
   function furnsh_c load a kernel file into the kernel pool as shown
   below.

      CALL FURNSH ( 'frame_kernel_name' )
      furnsh_c    ( "frame_kernel_name" );

   This file was created and may be updated with a text editor or word
   processor.


SMART-1 mission NAIF ID Codes -- Summary Section
========================================================================
 
   The following names and NAIF ID codes are assigned to the SMART-1
   spacecraft, its structures and science instruments (the keywords
   implementing these definitions are located in the section "SMART-1
   Mission NAIF ID Codes -- Definition Section" at the end of this
   file):


   SMART-1 Spacecraft and Spacecraft Structures names/IDs:

            SMART-1                -238      (synonyms: SMART1,
                                              SM1, S1 ) 
                                              
            SMART1_SPACECRAFT      -238000   (synonym: SMART1_SC)
            SMART1_SA+Y            -238010
            SMART1_SA+Y_BAPTA      -238011
            SMART1_SA+Y_C1         -238012
            SMART1_SA+Y_C2         -238013
            SMART1_SA+Y_C3         -238014
            SMART1_SA+Y_C4         -238015
            SMART1_SA-Y            -238020
            SMART1_SA-Y_BAPTA      -238021
            SMART1_SA-Y_C1         -238022
            SMART1_SA-Y_C2         -238023
            SMART1_SA-Y_C3         -238024
            SMART1_SA-Y_C4         -238025
            SMART1_MGA             -238030
            SMART1_LGA-1           -238040
            SMART1_LGA-2           -238050
            SMART1_SEPP            -238060
            SMART1_SS1             -238070
            SMART1_SS2             -238071
            SMART1_SS3             -238072

   AMIE names/IDs:

            SMART1_AMIE_CCD        -238100
            SMART1_AMIE_NONE       -238110
            SMART1_AMIE_LASER      -238120
            SMART1_AMIE_VIS_X      -238130
            SMART1_AMIE_VIS_Y      -238131
            SMART1_AMIE_FEL_X      -238140
            SMART1_AMIE_FEL_Y      -238141
            SMART1_AMIE_FEH_X      -238150
            SMART1_AMIE_FEH_Y      -238151

   SIR names/IDs:

            SMART1_SIR             -238200

   D-CIXS names/IDs:
            
            SMART1_DCIXS           -238300
            SMART1_DCIXS_FACET1    -238310
            SMART1_DCIXS_FACET2    -238320
            SMART1_DCIXS_FACET3    -238330

   KATE/RSIS names/IDs:

            SMART1_KATE_X          -238400
            SMART1_KATE_KA         -238410

   EPDP names/IDs:
        [TBD]

   SPEDE names/IDs:

            SMART1_SPEDE+X         -238600
            SMART1_SPEDE-X         -238610

   XSM names/IDs:

            SMART1_XSM             -238700



SMART-1 Frames
========================================================================

   The following SMART-1 frames are defined in this kernel file:

           Name                  Relative to           Type       NAIF ID
      ======================  ===================  ============   =======


   SMART-1 Spacecraft and Spacecraft Structures frames:
   ----------------------------------------------------
      SMART1_SPACECRAFT       J2000                   CK          -238000
      SMART1_SA+Y             SMART1_SA+Y_BAPTA       FIXED       -238010
      SMART1_SA+Y_BAPTA       SMART1_SPACECRAFT       CK          -238011
      SMART1_SA-Y             SMART1_SA-Y_BAPTA       FIXED       -238020
      SMART1_SA-Y_BAPTA       SMART1_SPACECRAFT       CK          -238021
      SMART1_MGA              SMART1_SPACECRAFT       FIXED       -238030
      SMART1_LGA-1            SMART1_SPACECRAFT       FIXED       -238040
      SMART1_LGA-2            SMART1_SPACECRAFT       FIXED       -238050
      SMART1_SEPP             SMART1_SPACECRAFT       FIXED       -238060
      SMART1_SS1              SMART1_SPACECRAFT       FIXED       -238070
      SMART1_SS2              SMART1_SPACECRAFT       FIXED       -238071
      SMART1_SS3              SMART1_SPACECRAFT       FIXED       -238072

   AMIE Frames:
   ------------
      SMART1_AMIE_CCD         SMART1_SPACECRAFT       FIXED       -238100
      SMART1_AMIE_NONE        SMART1_AMIE_CCD         FIXED       -238110
      SMART1_AMIE_LASER       SMART1_AMIE_CCD         FIXED       -238120
      SMART1_AMIE_VIS_X       SMART1_AMIE_CCD         FIXED       -238130
      SMART1_AMIE_VIS_Y       SMART1_AMIE_CCD         FIXED       -238131
      SMART1_AMIE_FEL_X       SMART1_AMIE_CCD         FIXED       -238140
      SMART1_AMIE_FEL_Y       SMART1_AMIE_CCD         FIXED       -238141
      SMART1_AMIE_FEH_X       SMART1_AMIE_CCD         FIXED       -238150
      SMART1_AMIE_FEH_Y       SMART1_AMIE_CCD         FIXED       -238151
      
   SIR Frames:
   -----------
      SMART1_SIR              SMART1_SPACECRAFT       FIXED       -238200

   D-CIXS Frames:
   --------------
      SMART1_DCIXS            SMART1_SPACECRAFT       FIXED       -238300

   KATE/RSIS Frames:
   -----------------
      SMART1_KATE_X           SMART1_SPACECRAFT       FIXED       -238400
      SMART1_KATE_KA          SMART1_SPACECRAFT       FIXED       -238410

   EPDP Frames:
   ------------
      [TBD]

   SPEDE Frames:
   -------------
      SMART1_SPEDE+X          SMART1_SPACECRAFT       FIXED       -238600
      SMART1_SPEDE-X          SMART1_SPACECRAFT       FIXED       -238610

   XSM Frames:
   -----------
      SMART1_XSM              SMART1_SPACECRAFT       FIXED       -238700

 SMART-1 Spacecraft and Spacecraft Structures Frame Tree
========================================================================

   The diagram below shows the frame hierarchy for the SMART1 spacecraft
   and its structure frame (not including science instrument frames.)


                          "J2000" INERTIAL
       +---------------------------------------------------+
       |                         |                         |
       |                         |                         |
       |<-pck                    |                    pck->|
       |                         |                         |
       V                         |                         V
   "IAU_MOON"                    |                    "IAU_EARTH"
 MOON BODY-FIXED                 |                 EARTH BODY-FIXED
 ---------------                 |                 ----------------
                                 |
                                 |<-ck
                                 |
                                 V
                       "SMART1-SPACECRAFT"
     +--------------------------------------------------------------+
     |                |      .        |     |   |   |   |   |       |
     |<-ck            |      . fixed->|     |   |   |   |   |       |<-fixed
     |                |      .        |     |   |   |   |   |       |
     V                |      .        V     |   |   |   |   |       V
"SMART1_SA+Y_BAPTA"   |<-ck  . "SMART1_SS1" |   |   |   |   | "SMART1_LGA-2"
 ------------------   |      . -----------  |   |   |   |   | --------------
     |                V      .              |   |   |   |   |
     |   "SMART1_SA-Y_BAPTA" .       fixed->|   |   |   |   |<-fixed
     |    ------------------ .              |   |   |   |   |
     |                |      .              V   |   |   |   V
     |                |      .     "SMART1_SS2" |   |   | "SMART1_LGA-1"
     |<-fixed  fixed->|      .     ------------ |   |   | -------------
     |                |      .                  |   |   |
     V                V      .           fixed->|   |   |<-fixed
"SMART1_SA+Y"  "SMART1_SA-Y" .                  |   |   |
-------------  ------------- .                  V   |   V
                             .        "SMART1_SS3"  | "SMART1_MGA"
                             .        ------------  | ------------
                             .                      |
                             .                      |<-fixed
                             .                      V
                             .                "SMART1_SEPP"
                             .                -------------
                             V    
        Individual instrument frame trees are provided
             in the other sections of this file


SMART-1 Spacecraft and Spacecraft Structures Frames
========================================================================

   This section of the file contains the definitions of the spacecraft
   and spacecraft structures frames.


SMART-1 Spacecraft Frame
--------------------------------------

   According to [4] the SMART-1 spacecraft frame is defined as follows:

      -  +Z axis is perpendicular to the launcher interface plane,
         directed positively through the S/C body;

      -  +X axis is perpendicular to the Z-axis and the solar array
         drive axis, directed positively through the side of the S/C
         containing the Medium Gain Antenna;

      -  +Y axis completes the right-handed system.

      -  the origin of this frame is the launch vehicle interface point.

   These diagrams illustrate the SMART1_SPACECRAFT frame:


   +X s/c side view:
   -----------------
                                    ^
                                    | Nadir
                                    |   

                             ._____________.
                             |           . |
      =====================o |          'o`| o=====================
      -Y Solar Array         |          `.'KaTE      +Y Solar Array
                             |    +Zsc  'o`|
                             |      ^   `-'|
                             |      |   .  |
                             |      |  'o` MGA
                             .______|__`-'_.              +Xsc is out 
                               |    |    |                of the page
                               .____o-------> +Ysc
                                  /   \                                
                                 /_____\ Main Engine                 


   +Z s/c side view:
   -----------------
 

                                  ____ MGA    
                                  \   /   
      .________________.     ._____\^/_____.     .________________.
      |                 \    |      |+Xsc  |    /                 |
      |                  \   |      |      |   /                  |
      |                   |  |      |    +Ysc |                   |
      |                   |o=|      x------->o|                   |
      |                   |  |       +Zsc  |  |                   |
      |                  /   |             |   \                  |
      ._________________/    ._____________.    \_________________.
       -Y Solar Array                               +Y Solar Array
                                          
                                          
                                                    +Zsc is into the page.



   Since the orientation of the SM1_SPACECRAFT frame is computed
   on-board, sent down in telemetry, and stored in the s/c CK files, it
   is defined as a CK-based frame.
 
   \begindata

      FRAME_SMART1_SPACECRAFT          = -238000
      FRAME_-238000_NAME               = 'SMART1_SPACECRAFT'
      FRAME_-238000_CLASS              =  3
      FRAME_-238000_CLASS_ID           = -238000
      FRAME_-238000_CENTER             = -238
      CK_-238000_SCLK                  = -238
      CK_-238000_SPK                   = -238

   \begintext


SMART-1 Solar Array Frames
--------------------------------------

   The SMART-1 solar arrays can be articulated (having one degree of
   freedom). The solar array frames are defined in a way consistent with
   the other instrument frames, with +Z axis pointing normal to the active
   solar panel cells.

   Because of this, it is required to incorporate a new frame in the
   chain, the SMART-1 Solar Array BAPTA frames that describe the
   solar arrays frames as described in the documentation and ingeneering
   models, and are defined as a CK-based frames.


SMART-1 Solar Array BAPTA Frames
--------------------------------

   Since the SMART-1 solar arrays can be articulated, and to comply with
   the documentation available for SMART-1, the solar Array BAPTA frames,
   SMART1_SA+Y_BAPTA and SMART1_SA-Y_BAPTA, are defined as CK frames with
   their orientation given relative to the SMART1_SPACECRAFT frame.

   Both arrays BAPTA frames are defined as follows (from [10], [11] and [12]):

      -  +Y is parallel to the longest side of the array, positively oriented
         from the yoke to the end of the wing;

      -  +X is normal to the solar array plane, the solar cells facing +X;

      -  +Z is defined such that (X,Y,Z) is right handed;

      -  the origin of the frame is located at the yoke geometric center.

   The axis of rotation is parallel to the Y axis of the spacecraft and
   solar array frames. The zero position of the Solar Panel is when the
   BAPTA's +X axis is aligned with the -Z s/c axis. 

   Note that for solar array +Y and -Y, the positive and negative angles
   are exactly opposite (in the nominal case), i.e. when both solar arrays
   are pointing in the +X s/c direction, the Solar Panel +Y is -90 degrees
   position, while the Solar Panel -Y is in +90 degrees.

   This diagram illustrates the SMART1_SA+Y_BAPTA and SMART1_SA-Y_BAPTA
   frames:
    
   +X s/c side view:
   -----------------

                  +Xsa-y_b ^                 ^ +Xsa+y_b
                           |                 |
                           |                 |
                           |                 |
                +Ysa-y_b   | ._____________. |    +Ysa+y_b
 -Y SA cell side <---------o |           . | x--------->  +Y SA, cell side
      =====================o |          'o`| o=====================
                             |          `.'|      
                             |   +Zsc   'o` KaTE
                             |      ^   `-'|
                             |      |   .  |      +Zsa+y_b is into the page
                             |      |  'o` MGA    +Zsa-y_b is out of the page
                             .______|__`-'_.
                               |    |    |
                               .____o-------> +Ysc
                                +Xsc  \
                                 /_____\ Main Engine


   Since the orientation of both array BAPTA frames is computed
   on-board, sent down in telemetry, and stored in the Solar Array CK files,
   they are defined as a CK-based frame.

   \begindata

      FRAME_SMART1_SA+Y_BAPTA          = -238011
      FRAME_-238011_NAME               = 'SMART1_SA+Y_BAPTA'
      FRAME_-238011_CLASS              =  3
      FRAME_-238011_CLASS_ID           = -238011
      FRAME_-238011_CENTER             = -238
      CK_-238011_SCLK                  = -238
      CK_-238011_SPK                   = -238

      FRAME_SMART1_SA-Y_BAPTA          = -238021
      FRAME_-238021_NAME               = 'SMART1_SA-Y_BAPTA'
      FRAME_-238021_CLASS              =  3
      FRAME_-238021_CLASS_ID           = -238021
      FRAME_-238021_CENTER             = -238
      CK_-238021_SCLK                  = -238
      CK_-238021_SPK                   = -238

   \begintext


Solar Array Frames
------------------
      
   The Solar Array frames are defined as follows, for consistency with
   other instruments on the spacecraft:

      -  +Y is parallel to the longest side of the array, positively oriented
         from the yoke to the end of the wing;

      -  +Z is normal to the solar array plane, the solar cells facing +Z;

      -  +X is defined such that (X,Y,Z) is right handed;

      -  the origin of the frame is located at the yoke geometric center.

   The Solar Array frames, SMART1_SA+Y and SMART1_SA-Y, are defined with
   respect to an CK-based itermediate frame, SMART1_SA+Y_BAPTA and
   SMART1_SA-Y_BAPTA. Nominally, as single rotation of 90 degrees about 
   the +Y axis is required to co-align each of the BAPTA frames with its
   Solar Array frame.   

   +Z s/c side view:
   -----------------
 

                                              
     -Y SA, cell side                                +Y SA, cell side
      .________^_______.     ._____________.     .________^_______.
      |        |+Xsa-y  \    |             |    / +Zsa+y_b|       |
      |        |         \   |             |   /          |   +Ysa+y
      |        |          |  |             |  |           |   +Ysa+y_b
      |  <-----o-o        |o=|             |=o|         o-o-----> |
      | +Ysa-y   |        |  |             |  |         |         |
      | +Ysa-y_b |       /   |             |   \        |         |
      .__________|+Zsa-y_b   ._____________.    \_______|+Xsa+y___.
                 v                                      v
       -Y Solar Array                               +Y Solar Array
                                          
                                          
                                   +Zsa-y and +Zsa+y are out of the page.
                                   +Xsa-y_b and +Xsa+y_b are out of the page.

   Since the SPICE frames subsystem calls for specifying the reverse
   transformation--going from the instrument or structure frame to the
   base frame--as compared to the description given above, the order of
   rotations assigned to the TKFRAME_*_AXES keyword is also reversed
   compared to the above text, and the signs associated with the
   rotation angles assigned to the TKFRAME_*_ANGLES keyword are the
   opposite from what is written in the above text.

  \begindata

      FRAME_SMART1_SA+Y                =  -238010
      FRAME_-238010_NAME               = 'SMART1_SA+Y'
      FRAME_-238010_CLASS              =  4
      FRAME_-238010_CLASS_ID           =  -238010
      FRAME_-238010_CENTER             =  -238
      TKFRAME_-238010_RELATIVE         = 'SMART1_SA+Y_BAPTA'
      TKFRAME_-238010_SPEC             = 'ANGLES'
      TKFRAME_-238010_UNITS            = 'DEGREES'
      TKFRAME_-238010_ANGLES           = (   0.000, -90.000,   0.000 )
      TKFRAME_-238010_AXES             = (   1,        2,       3     )

      FRAME_SMART1_SA-Y                =  -238020
      FRAME_-238020_NAME               = 'SMART1_SA-Y'
      FRAME_-238020_CLASS              =  4
      FRAME_-238020_CLASS_ID           =  -238020
      FRAME_-238020_CENTER             =  -238
      TKFRAME_-238020_RELATIVE         = 'SMART1_SA-Y_BAPTA'
      TKFRAME_-238020_SPEC             = 'ANGLES'
      TKFRAME_-238020_UNITS            = 'DEGREES'
      TKFRAME_-238020_ANGLES           = (   0.000, -90.000,   0.000 )
      TKFRAME_-238020_AXES             = (   1,        2,       3     )

   \begintext


SMART-1 Medium Gain Antenna Frame
--------------------------------------

   The SMART-1 Medium Gain Antenna is rigidly attached to the +X side of the
   s/c bus.  Therefore, the SMART1 MGA frame, SMART1_MGA, is defined as a
   fixed offset frame with its orientation given relative to the
   SMART1_SPACECRAFT frame.

   The SMART1_MGA frame is defined as follows:

      -  +Z axis is in the antenna boresight direction (nominally
         along the s/c +X axis);

      -  +Y axis is in the direction of the s/c +Y axis ;

      -  +X completes the right hand frame;

      -  the origin of the frame is located at the geometric center of the
         MGA horn.

   This diagram illustrates the SMART1_MGA frame:

   +Z s/c side view:
   -----------------                ^
                                    |+Zmga
                                    |
                              +Xmga |       +Ymga
                                  __o------->
                                  \   / MGA  
      .________________.     ._____\^/_____.     .________________.
      |                 \    |      |+Xsc  |    /                 |
      |                  \   |      |      |   /                  |
      |                   |  |      |    +Ysc |                   |
      |                   |o=|      x------->o|                   |
      |                   |  |       +Zsc  |  |                   |
      |                  /   |             |   \                  |
      ._________________/    ._____________.    \_________________.
       -Y Solar Array                               +Y Solar Array
                                          
                                                    +Xmga is out of the
                                                     page.
                                                    +Zsc is into the page.


   Nominally a single rotation of +90 degrees about the +Y axis is needed to
   co-align the s/c frame with the MGA frame.

   Since the SPICE frames subsystem calls for specifying the reverse
   transformation--going from the instrument or structure frame to the
   base frame--as compared to the description given above, the order of
   rotations assigned to the TKFRAME_*_AXES keyword is also reversed
   compared to the above text, and the signs associated with the
   rotation angles assigned to the TKFRAME_*_ANGLES keyword are the
   opposite from what is written in the above text.


   \begindata

      FRAME_SMART1_MGA                 =  -238030
      FRAME_-238030_NAME               = 'SMART1_MGA'
      FRAME_-238030_CLASS              =  4
      FRAME_-238030_CLASS_ID           =  -238030
      FRAME_-238030_CENTER             =  -238
      TKFRAME_-238030_RELATIVE         = 'SMART1_SPACECRAFT'
      TKFRAME_-238030_SPEC             = 'ANGLES'
      TKFRAME_-238030_UNITS            = 'DEGREES'
      TKFRAME_-238030_ANGLES           = (   0.000, -90.000,   0.000 )
      TKFRAME_-238030_AXES             = (   1,        2,       3     )

   \begintext

SMART-1 Low Gain Antennas Frames
--------------------------------------

   The SMART-1 Low Gain Antennas are rigidly attached to the +X and -X side
   of the s/c bus.  Therefore, the SMART-1 Low Gain Antenna frames, 
   SMART1_LGA-1 and SMART1_LGA-2, are defined as fixed offset frames with
   their orientation given relative to the SMART1_SPACECRAFT frame.

   The frames for the two SMART-1 Low Gain antennas --  LGA-1 
   and LGA-2 -- are defined as follows:

      -  +Z axis is in the antenna boresight direction;

      -  +Y axis is nominally parallel to the s/c +Y axis;

      -  +X axis completes the right hand frame;

      -  the origin of the frame is located at the geometric center of
         the antenna outer side.

   LGA-1 and LGA-2 antennas are rigidly mounted on the +X and -X spacecraft
   panels, respectively.

   This diagram illustrates the SMART1_LGA-1 and SMART1_LGA-2 frames:

   +Z s/c side view:
   -----------------            ^
                                |+Zlga1
                                |
                         +Xlga1 |       +Ylga1
                                o------->
                               ||            
      .________________.     ._||___^______.     .________________.
      |                 \    |      |+Xsc  |    /                 |
      |                  \   |      |      |   /                  |
      |                   |  |      |    +Ysc |                   |
      |                   |o=|      x------->o|                   |
      |                   |  |       +Zsc  |  |                   |
      |                  /   |             |   \                  |
      ._________________/    ._____________.    \_________________.
       -Y Solar Array                  ||           +Y Solar Array
                                       ||   
                                 +Xlga2 x------->     
                                        |      +Ylga2
                                        |
                                        | +Zlga2
                                        v

               +Xlga1 is out of the page.
               +Zsc and +Xlga2 are into the page.


   Nominally a single rotation of +90 degrees about the +Y axis is needed to
   co-align the s/c frame with the LGA-1 frame. A single rotation of -90
   degrees about the +Y axis is required to co-align the s/c frame with the
   LGA-2 antenna frame.

   Since the SPICE frames subsystem calls for specifying the reverse
   transformation--going from the instrument or structure frame to the
   base frame--as compared to the description given above, the order of
   rotations assigned to the TKFRAME_*_AXES keyword is also reversed
   compared to the above text, and the signs associated with the
   rotation angles assigned to the TKFRAME_*_ANGLES keyword are the
   opposite from what is written in the above text.


   \begindata

      FRAME_SMART1_LGA-1               =  -238040
      FRAME_-238040_NAME               = 'SMART1_LGA-1'
      FRAME_-238040_CLASS              =  4
      FRAME_-238040_CLASS_ID           =  -238040
      FRAME_-238040_CENTER             =  -238
      TKFRAME_-238040_RELATIVE         = 'SMART1_SPACECRAFT'
      TKFRAME_-238040_SPEC             = 'ANGLES'
      TKFRAME_-238040_UNITS            = 'DEGREES'
      TKFRAME_-238040_ANGLES           = (   0.000,  -90.000,   0.000 )
      TKFRAME_-238040_AXES             = (   1,       2,       3     )

      FRAME_SMART1_LGA-2               =  -238050
      FRAME_-238050_NAME               = 'SMART1_LGA-2'
      FRAME_-238050_CLASS              =  4
      FRAME_-238050_CLASS_ID           =  -238050
      FRAME_-238050_CENTER             =  -238
      TKFRAME_-238050_RELATIVE         = 'SMART1_SPACECRAFT'
      TKFRAME_-238050_SPEC             = 'ANGLES'
      TKFRAME_-238050_UNITS            = 'DEGREES'
      TKFRAME_-238050_ANGLES           = (   0.000, +90.000,  0.000 )
      TKFRAME_-238050_AXES             = (   1,       2,       3     )

   \begintext


SMART-1 Solar Sensor Frames
--------------------------------------
     TBW/TBD

SMART-1 Solar Electric Primary Propulsion Frame
----------------------------------------------------
     TBW/TBD



AMIE Frames
========================================================================

   This section of the file contains the definitions of the AMIE
   frames.


AMIE Frame Tree
--------------------------------------

   The diagram below shows the AMIE frames hierarchy.


                          "J2000" INERTIAL
       +---------------------------------------------------+
       |                         |                         |
       |                         |                         |
       |<-pck                    |                    pck->|
       |                         |                         |
       V                         |                         V
   "IAU_MOON"                    |                    "IAU_EARTH"
 MOON BODY-FIXED                 |                 EARTH BODY-FIXED
 ---------------                 |                 ----------------
                                 |         
                                 |<-ck
                                 |
                                 V 
                         "SMART1-SPACECRAFT"
                         -------------------       
                                 |
                                 |
                                 |<-fixed
                                 |
                                 V
                          "SMART1_AMIE_CCD"
          +------------------------------------------------------+
          |           |         |    |    |      |    |          |
          |           |         |    |    |      |    |          |
          |<-fixed    |         |    |    |      |    |          |
          |           |         |    |    |      |    |          |
          V           |         |    |    |      |    |          |
  "SMART1_AMIE_NONE"  |<-fixed  |    |    |      |    |          |
  ------------------  |         |    |    |      |    |          |
                      V         |    |    |      |    |          |
       "SMART1_AMIE_LASER"      |    |    |      |    |          |
       -------------------      |    |    |      |    |          |
                                |    |    |      |    |          |<-fixed
                                |    |    |      |    |          |
                                V    |    |      |    |          V
                "SMART1_AMIE_VIS_X"  |    |      |    |  "SMART1_AMIE_VIS_Y"
                -------------------  |    |      |    |  -------------------
                                     |    |      |    |
                              fixed->|    |      |    |<-fixed
                                     |    |      |    |
                                     V    |      |    V
                     "SMART1_AMIE_FEL_X"  |      |  "SMART1_AMIE_FEL_Y"
                     -------------------  |      |  -------------------
                                          |      |
                                   fixed->|      |<-fixed
                                          |      |
                                          V      V
                          "SMART1_AMIE_FEH_X"  "SMART1_AMIE_FEH_Y"
                          -------------------  -------------------


AMIE Camera Frames
--------------------------------------

   For a detailed description of the following procedure, please consult [13].

   The AMIE camera is mounted on the -X side on the spacecraft, that is,
   on the side paralel to the YZ plane of the SMART-1 frame towards the -X 
   direction of the same frame, as it is drawn in the figure below:
  
        
                                  _____ MGA                            
                                  \   /   
      .________________.     ._____\^+Xsc__.     .________________.
      |                 \    |      |      |    /                 |
      |                  \   |      |      |   /                  |
      |                   |  +Ysc   |      |  |                   |
      |                   |o<-------o      |=o|                   |
      |                   |  |   +Zsc      |  |                   |
      |                  /   |             |   \                  |
      ._________________/    ._____________.    \.________________.
       +Y Solar Array                |   |           -Y Solar Array
                                     | O |      
                                     |___| AMIE 

   The AMIE CCD frame allows to model several effects present, namely:
    - The AMIE camera is not perfectly aligned, on purpose. There is a small 
      misalignment that we have to take into account.
    - There is a lens between the AMIE CCD and the "real world", which turns the images
      upside down and left to right.
    
   The AMIE CCD frame, as physically seen in the spacecraft, is defined as follows:
    - The +Z axis of the frame is aligned with the boresight of the camera, which, if we
      don't take into account the misalignment, is aligned with the +Z axis of the
      spacecraft frame (SMART1_SPACECRAFT).
    - The +X axis of the AMIE CCD frame is aligned (apart from misalignments) with the
      +Y axis of the spacecraft frame (SMART1_SPACECRAFT).
    - The +Y axis of the AMIE CCD frame is aligned (apart from misalignments) with the
      -X axis of the spacecraft frame (SMART1_SPACECRAFT).
    
   This situation is drawn in the next diagram:
  
  
                                  _____ MGA                            
                                  \   /   
      .________________.     ._____\^+Xsc__.     .________________.
      |                 \    |      |      |    /                 |
      |                  \   |      |      |   /                  |
      |                   |  +Ysc   |      |  |                   |
      |                   |o<-------o      |=o|                   |
      |                   |  |   +Zsc      |                   |
      |                  /   |             |   \                  |
      ._________________/    ._____________.    \.________________.
       +Y Solar Array                |   |           -Y Solar Array
                               <-----|-O |      
                            +Xccd    |_|_| AMIE   
                                       |
                                       |
                                       V +Yccd
                                      

   The lens, as stated above, introduces a rotation by 180 degrees in the image, so,
   the images appear to be flipped vertically and horizontally in the CCD. This situation
   is drawn in the next diagram:
  
   
              ^+Yccd                                      ^+Xsc
              |                                           |
              |                                           |
              |                                           |
              |                                           |
              |                                           |
              |                                           |
              O-----------> +Xccd             <-----------O+Zsc
              +Zccd                           +Ysc
             
   Thus, in order to align the CCD frame with the spacecraft frame, the former has to be 
   rotated +90 degrees about the +Z axis.
  
   Now the misalignment has to be compensated. When the +Z axis of the spacecraft points to a
   star, it appears in the CCD as in the next diagram:
        
               
   
                               ^ +Yccd 
                               | 
                               | 
                               | 
             .----------------------------------.
             |                 |                |
             |                 |   alpha        |
             |                 |<-------->* Star|
             |                 |          ^     |
             |                 |          |     |
             |                 |    beta  |     |
             |                 |          |     |
             |                 |          V     |
             |-----------------O----------------|----------> +Xccd
             |                 |+Zccd           |
             |                 |                |
             |                 |                |
             |                 |                |
             |                 |                |
             |                 |                |
             |                 |                |
             |                 |                |
             .                 |                .
              ----------------------------------


               
             
   The star is offset on the CCD by two angles, which according to [5] have the following values:
  
       alpha : 0.537 degrees
       betha : 0.665 degrees    
              
             
   After performing the 90 degrees rotation about the +Z axis, the CCD is orientated as in the
   next figure:
  
               
   
                                 ^ +Xccd 
                                 | 
                                 | 
                                 | 
               .----------------------------------.
               |                 |                |
               |                 |   alpha        |
               |                 |<-------->* Star|
               |                 |          ^     |
               |                 |          |     |
               |                 |    betha |     |
               |                 |          |     |
               |                 |          V     |
    <----------|-----------------O----------------|
    +Yccd      |                 |+Zccd           |
               |                 |                |
               |                 |                |
               |                 |                |
               |                 |                |
               |                 |                |
               |                 |                |
               |                 |                |
               .                 |                .
                ----------------------------------

             
             
   So, in order to align the CCD frame to the spacecraft frame, three rotations have to be performed:
     
       1) Rotate the CCD frame 90 degrees about the +Z axis. Note that after this rotation, the star
          appears in the 4th quadrant, that is, its x coordinate is positive and its y coordinate is
          negative.
       2) Rotate the CCD frame -beta degrees about the +Y axis.
       3) Rotate the CCD frame -alpha degrees about the +X axis.
      
   If Mccd->sc is the matrix that turns the CCD frame into the spacecraft frame (that is the way it has
   to be specified in a frames kernel), then,
     
           Mccd->sc = [-0.537] [-0.665] [ 90 ]   
                              X        Y      Z
    
   Note that the actual Euler angles are being approximated by the offset angles.                          
     
                               
   These values are included in the definition below.

   \begindata

      FRAME_SMART1_AMIE_CCD            =  -238100
      FRAME_-238100_NAME               = 'SMART1_AMIE_CCD'
      FRAME_-238100_CLASS              =  4
      FRAME_-238100_CLASS_ID           =  -238100
      FRAME_-238100_CENTER             =  -238
      TKFRAME_-238100_RELATIVE         = 'SMART1_SPACECRAFT'
      TKFRAME_-238100_SPEC             = 'ANGLES'
      TKFRAME_-238100_UNITS            = 'DEGREES'
      TKFRAME_-238100_ANGLES           = ( 0.537, 0.665, 90.0 )
      TKFRAME_-238100_AXES             = ( 1, 2, 3   )

   \begintext


AMIE Filters Reference Frames
--------------------------------------

   The following figure shows the position of the boresight of the different 
   filters in the AMIE_CCD frame:


            .---------------------------------------.
            |                   |                   |
            |         +Z        |                   |
            |         o VIS_Y   |                   |
            |                   |                   |
            |                   |         +Z        |
            |-------------------|         o NONE    |
            |                   |                   |
            |         +Z        |                   |
            |         o FeL_Y   |                   |
            |                   |                   |
            |                   |+Z                 |
            |-------------------o--CCD--------------|
            |                   |         |         |
            |         +Z        |         |         |
            |         o FeH_Y   |         |         |
            |                   |         |         |
            |           +Z      | +Z      | +Z      |
            |---------.   FeH_X |   FeL_X |   VIS_X |
            |         |    o    |    o    |    o    |    ^
            |    +Z   |         |         |         |    | +Yccd
            |    o LAS|         |         |         |    |
            |         |         |         |         |    |
            .         |         |         |         .    |
             ---------------------------------------     o--------> 
                                                               +Xccd

                                                             +Zccd is out
                                                              of the page.

    
   The angles between the AMIE CCD boresight and the boresight of each of 
   filters are specified in 5:  
                                                              
   
                            Offset Angle      Offset Angle
                           in y direction    in x direction 
      Filter                 in degrees        in degrees
      -------------------  ---------------   --------------
      Visible Y                    +1.9875          +1.325
      Fe. Low Y                    +0.6625          +1.325 
      None                         +1.325           -1.325
      Fe. High Y                   -0.6625          +1.325
      Laser                        -1.9875          +1.9875
      Fe. Low X                    -1.325           -0.6625
      Visible X                    -1.325           -1.9875
      Fe. High X                   -1.325           +0.6625  
      
      
   The first angle measures the angle that we have to travel along the +Y axis 
   of the CCD in order to find the filter boresight, therefore it specifies a 
   rotation about the +X axis of the CCD.
  
   The second angle measures the angle that we have to travel along the +X axis 
   of the CCD in order to find the filter boresight, therefore it specifies a 
   rotation about the +Y axis of the CCD.  

   Note: 'Fe' stands for iron. The 'Fe' filters are used to study the iron 
         absorption line.

   \begindata

      FRAME_SMART1_AMIE_VIS_Y          =  -238131
      FRAME_-238131_NAME               = 'SMART1_AMIE_VIS_Y'
      FRAME_-238131_CLASS              =  4
      FRAME_-238131_CLASS_ID           =  -238131
      FRAME_-238131_CENTER             =  -238
      TKFRAME_-238131_RELATIVE         = 'SMART1_AMIE_CCD'
      TKFRAME_-238131_SPEC             = 'ANGLES'
      TKFRAME_-238131_UNITS            = 'DEGREES'
      TKFRAME_-238131_ANGLES           = ( 1.9875, 1.325, 0.0 )
      TKFRAME_-238131_AXES             = ( 1, 2, 3 )

      FRAME_SMART1_AMIE_FEL_Y          =  -238141
      FRAME_-238141_NAME               = 'SMART1_AMIE_FEL_Y'
      FRAME_-238141_CLASS              =  4
      FRAME_-238141_CLASS_ID           =  -238141
      FRAME_-238141_CENTER             =  -238
      TKFRAME_-238141_RELATIVE         = 'SMART1_AMIE_CCD'
      TKFRAME_-238141_SPEC             = 'ANGLES'
      TKFRAME_-238141_UNITS            = 'DEGREES'
      TKFRAME_-238141_ANGLES           = ( 0.6625, 1.325, 0.0 )
      TKFRAME_-238141_AXES             = ( 1, 2, 3   )

      FRAME_SMART1_AMIE_NONE           =  -238110
      FRAME_-238110_NAME               = 'SMART1_AMIE_NONE'
      FRAME_-238110_CLASS              =  4
      FRAME_-238110_CLASS_ID           =  -238110
      FRAME_-238110_CENTER             =  -238
      TKFRAME_-238110_RELATIVE         = 'SMART1_AMIE_CCD'
      TKFRAME_-238110_SPEC             = 'ANGLES'
      TKFRAME_-238110_UNITS            = 'DEGREES'
      TKFRAME_-238110_ANGLES           = ( 1.325, -1.325, 0.0 )
      TKFRAME_-238110_AXES             = ( 1, 2, 3   )

      FRAME_SMART1_AMIE_FEH_Y          =  -238151
      FRAME_-238151_NAME               = 'SMART1_AMIE_FEH_Y'
      FRAME_-238151_CLASS              =  4
      FRAME_-238151_CLASS_ID           =  -238151
      FRAME_-238151_CENTER             =  -238
      TKFRAME_-238151_RELATIVE         = 'SMART1_AMIE_CCD'
      TKFRAME_-238151_SPEC             = 'ANGLES'
      TKFRAME_-238151_UNITS            = 'DEGREES'
      TKFRAME_-238151_ANGLES           = ( -0.6625, 1.325, 0.0 )
      TKFRAME_-238151_AXES             = (  1, 2, 3 )

      FRAME_SMART1_AMIE_LASER          =  -238120
      FRAME_-238120_NAME               = 'SMART1_AMIE_LASER'
      FRAME_-238120_CLASS              =  4
      FRAME_-238120_CLASS_ID           =  -238120
      FRAME_-238120_CENTER             =  -238
      TKFRAME_-238120_RELATIVE         = 'SMART1_AMIE_CCD'
      TKFRAME_-238120_SPEC             = 'ANGLES'
      TKFRAME_-238120_UNITS            = 'DEGREES'
      TKFRAME_-238120_ANGLES           = ( -1.9875, 1.9875, 0.0 )
      TKFRAME_-238120_AXES             = (  1, 2, 3   )

      FRAME_SMART1_AMIE_FEL_X          =  -238140
      FRAME_-238140_NAME               = 'SMART1_AMIE_FEL_X'
      FRAME_-238140_CLASS              =  4
      FRAME_-238140_CLASS_ID           =  -238140
      FRAME_-238140_CENTER             =  -238
      TKFRAME_-238140_RELATIVE         = 'SMART1_AMIE_CCD'
      TKFRAME_-238140_SPEC             = 'ANGLES'
      TKFRAME_-238140_UNITS            = 'DEGREES'
      TKFRAME_-238140_ANGLES           = ( -1.325, -0.6625, 0.0 )
      TKFRAME_-238140_AXES             = (  1, 2, 3   )

      FRAME_SMART1_AMIE_VIS_X          =  -238130
      FRAME_-238130_NAME               = 'SMART1_AMIE_VIS_X'
      FRAME_-238130_CLASS              =  4
      FRAME_-238130_CLASS_ID           =  -238130
      FRAME_-238130_CENTER             =  -238
      TKFRAME_-238130_RELATIVE         = 'SMART1_AMIE_CCD'
      TKFRAME_-238130_SPEC             = 'ANGLES'
      TKFRAME_-238130_UNITS            = 'DEGREES'
      TKFRAME_-238130_ANGLES           = ( -1.325, -1.9875, 0.0 )
      TKFRAME_-238130_AXES             = (  1, 2, 3   )

      FRAME_SMART1_AMIE_FEH_X          =  -238150
      FRAME_-238150_NAME               = 'SMART1_AMIE_FEH_X'
      FRAME_-238150_CLASS              =  4
      FRAME_-238150_CLASS_ID           =  -238150
      FRAME_-238150_CENTER             =  -238
      TKFRAME_-238150_RELATIVE         = 'SMART1_AMIE_CCD'
      TKFRAME_-238150_SPEC             = 'ANGLES'
      TKFRAME_-238150_UNITS            = 'DEGREES'
      TKFRAME_-238150_ANGLES           = ( -1.325, 0.6625, 0.0 )
      TKFRAME_-238150_AXES             = (  1, 2, 3   )

   \begintext


D-CIXS frames:
========================================================================

   This section of the file contains the definitions of the D-CIXS frames.


D-CIXS Frame Tree
--------------------------------------

   The diagram below shows the D-CIXS frame hierarchy.


                          "J2000" INERTIAL
       +---------------------------------------------------+
       |                         |                         |
       |                         |                         |
       |<-pck                    |                    pck->|
       |                         |                         |
       V                         |                         V
   "IAU_MOON"                    |                    "IAU_EARTH"
 MOON BODY-FIXED                 |                 EARTH BODY-FIXED
 ---------------                 |                 ----------------
                                 |         
                                 |<-ck
                                 |
                                 V 
                         "SMART1-SPACECRAFT"
                         -------------------       
                                 |              
                                 |              
                                 |<-fixed       
                                 |              
                                 V              
                          "SMART1_DCIXS"     
                          --------------           

D-CIXS Sensor Frame
--------------------------------------

   The D-CIXS detector frame -- SMART1_DCIXS  -- is defined as follows:

      -  +Z axis is nominally co-aligned with the s/c +Z axis;

      -  +Y axis is parallel to the detector array and it is
         nominally co-aligned with the s/c +Y axis;

      -  +X axis completes the right hand frame; it is nominally
         co-aligned with the s/c +X axis;

      -  the origin of the frame is located at detector focal point.

   The DCIXS frame, SMART1_DCIXS frame is defining the aligment of the
   DCIXS spectrometer with respect to the SMART-1 Spacecraft mechanical
   frame. This frame is fixed with respect to the spacecraft mechanical
   frame, SMART1_SPACECRAFT, and is nominally co-aligned with it, as shown
   on the diagram:

   +Z s/c side view:
   -----------------
                                                                        
                                                                          
                                  _____ MGA                            
                                  \   /   
      .________________.     ._____\^/_____.     .________________.
      |                 \    |      |+Xsc  |    /                 |
      |                  \   |      |    ^ |   /                  |
      |                   |  +Ysc   |    |+Xdb|                   |
      |                   |o<-------o    | |=o|                   |
      |                   |  |         ._|_|  .                   |
      |                  /   |    <------o |   \                  |
      ._________________/    .____+Ydb_.___.    \_________________.
       +Y Solar Array                     DCIXS     -Y Solar Array
                                          

                                             +Zsc and +Zdb are
                                                 out of page
                                              db = DCIXS


   These sets of keywords define the DCIXS frame:

   \begindata

      FRAME_SMART1_DCIXS               =  -238300
      FRAME_-238300_NAME               = 'SMART1_DCIXS'
      FRAME_-238300_CLASS              =  4
      FRAME_-238300_CLASS_ID           =  -238300
      FRAME_-238300_CENTER             =  -238
      TKFRAME_-238300_RELATIVE         = 'SMART1_SPACECRAFT'
      TKFRAME_-238300_SPEC             = 'ANGLES'
      TKFRAME_-238300_UNITS            = 'DEGREES'
      TKFRAME_-238300_ANGLES           = (   0.000,   0.000,   0.000 )
      TKFRAME_-238300_AXES             = (   1,       2,       3     )

   \begintext

XSM frames:
========================================================================

   This section of the file contains the definitions of the X-Ray Solar
   Monitor frame.


XSM Frame Tree
--------------------------------------

   The diagram below shows the XSM frame hierarchy.


                          "J2000" INERTIAL
       +---------------------------------------------------+
       |                         |                         |
       |                         |                         |
       |<-pck                    |                    pck->|
       |                         |                         |
       V                         |                         V
   "IAU_MOON"                    |                    "IAU_EARTH"
 MOON BODY-FIXED                 |                 EARTH BODY-FIXED
 ---------------                 |                 ----------------
                                 |         
                                 |<-ck
                                 |
                                 V 
                         "SMART1-SPACECRAFT"
                         -------------------       
                                 |              
                                 |              
                                 |<-fixed       
                                 |              
                                 V              
                           "SMART1_XSM"     
                           ------------            



X-Ray Solar Monitor Frame
--------------------------------------
   
   The  X-Ray Solar Monitor (XSM) is mounted on the +X panel of the S/C,
   opposite to the D-CIXS detector. The XSM frame -- SMART1_XSM --
   is fixed with respect to the spacecraft mechanical frame,
   SMART1_SPACECRAFT, and is defined as follows as described in [8]:

      -  +Z axis points in the boresight direction; and it is nominally
         rotated by -45 degrees from the s/c -Z axis about the s/c +Y axis; 

      -  +Y axis is nominally co-aligned with the s/c +Y axis;

      -  +X axis completes the right hand frame;

      -  the origin of the frame is located at the detector focal point. 

   X-Ray Solar Monitor frame, SMART1_XSM, is fixed with respect
   to the SMART1 spacecraft frame, SMART1_SPACECRAFT, and is nominally
   rotated by +135 degrees about +Y from it, as shown in the diagram:

   +Y s/c side view
   ----------------

                                ._____________.
                         +Zsc ^ |             |
                              | =======o========
                              | |           SA+Y
                     +Xsc     | |             |
                        <-----o+Ysc           |
                             .--|             |
                         XSM |o +Yxsm         |
                            .'-`._____________.
                          .'     `.  +Xxsm  |
                        .'         `._______.
                       '+Zxsm        /     
                                    /_____\
                                   Main Engine

                     +Ysc and +Yxsm are out of the page


   Since the SPICE frames subsystem calls for specifying the reverse
   transformation--going from the instrument or structure frame to the
   base frame--as compared to the description given above, the order of
   rotations assigned to the TKFRAME_*_AXES keyword is also reversed
   compared to the above text, and the signs associated with the
   rotation angles assigned to the TKFRAME_*_ANGLES keyword are the
   opposite from what is written in the above text.
      
   \begindata

      FRAME_SMART1_XSM                 =  -238700
      FRAME_-238700_NAME               = 'SMART1_XSM'
      FRAME_-238700_CLASS              =  4
      FRAME_-238700_CLASS_ID           =  -238700
      FRAME_-238700_CENTER             =  -238
      TKFRAME_-238700_RELATIVE         = 'SMART1_SPACECRAFT'
      TKFRAME_-238700_SPEC             = 'ANGLES'
      TKFRAME_-238700_UNITS            = 'DEGREES'
      TKFRAME_-238700_ANGLES           = (   0.000, -135.000,   0.000 )
      TKFRAME_-238700_AXES             = (   1,        2,       3     )

   \begintext

EPDP frames:
========================================================================

   [TBD]


KaTE/RSIS frames:
========================================================================


   This section of the file contains the definitions of the KaTE Antenna
   frames.


KaTE Frame Tree
--------------------------------------

   The diagram below shows the KaTE frame hierarchy.


                          "J2000" INERTIAL
       +---------------------------------------------------+
       |                         |                         |
       |                         |                         |
       |<-pck                    |                    pck->|
       |                         |                         |
       V                         |                         V
   "IAU_MOON"                    |                    "IAU_EARTH"
 MOON BODY-FIXED                 |                 EARTH BODY-FIXED
 ---------------                 |                 ----------------
                                 |         
                                 |<-ck
                                 |
                                 V 
                         "SMART1-SPACECRAFT"
                +---------------------------------+
                |                                 |              
                |                                 |              
                |                                 |<-fixed       
                |<-fixed                          |              
                |                                 V              
                V                         "SMART1_KATE_KA"        
         "SMART1_KATE_X"                  ----------------
         --------------- 



KaTE Antenna Frames
--------------------------------------

   The SMART-1 Deep Space X/Ka-band TT&C Experiment (KaTE) Antennas are
   rigidly attached to the +X side of the s/c bus.  Therefore, the SMART1
   KATE frames, SMART1_KATE_X and SMART1_KATE_KA, are defined as a
   fixed offset frames with their orientation given relative to the
   SMART1_SPACECRAFT frame.

   The SMART1 KATE frames are defined as follows:

      -  +Z axis is in the antenna boresight direction (nominally
         along the s/c +X axis);

      -  +Y axis is in the direction of the s/c +Y axis ;

      -  +X completes the right hand frame;

      -  the origin of the frame is located at the geometric center of the
          antenna's horn.

   This diagram illustrates the SMART1_KATE_X and SMART1_KATE_KA frames:

   +Z s/c side view:
   -----------------                ^ +Zka/+Zx
                                    | 
                                    | 
                           +Xka/+Xx |      +Yka/+Yx
                                  __o------->
                                  \   /KaTE
      .________________.     ._____\^/_____.     .________________.
      |                 \    |      |+Xsc  |    /                 |
      |                  \   |      |      |   /                  |
      |                   |  |      |    +Ysc |                   |
      |                   |o=|      x------->o|                   |
      |                   |  |       +Zsc  |  |                   |
      |                  /   |             |   \                  |
      ._________________/    ._____________.    \_________________.
       -Y Solar Array                               +Y Solar Array
                                                 
                                                 +Xka and +Xx are out of the
                                                  page.
                                                 +Zsc is into the page.

   +X s/c side view:
   -----------------
                                                  
                             ._____________.  
                             |           . |                    
      =====================o |          'o`| o=====================
      -Y SA cell side        |          `-'|       +Y SA, cell side
                             |          'o------>
                             |          `|'|   +Yka/+Yx
                             | +Zsc ^    | |                               
                             |      |    |+Xka/+x                        
                             .______|____v_.
                               |    |    |
                               .____o-------> +Ysc    
                                +Xsc  \
                                 /_____\ Main Engine
                                     
                                                       +Zka and +Zx are
                                                       into the page.
                                                       +Xsc is out of the
                                                       page

   Nominally a single rotation of +90 degrees about the +Y axis is needed to
   co-align the s/c frame with the KATE frames.

   Since the SPICE frames subsystem calls for specifying the reverse
   transformation--going from the instrument or structure frame to the
   base frame--as compared to the description given above, the order of
   rotations assigned to the TKFRAME_*_AXES keyword is also reversed
   compared to the above text, and the signs associated with the
   rotation angles assigned to the TKFRAME_*_ANGLES keyword are the
   opposite from what is written in the above text.


   \begindata

      FRAME_SMART1_KATE_X              =  -238400
      FRAME_-238400_NAME               = 'SMART1_KATE_X'
      FRAME_-238400_CLASS              =  4
      FRAME_-238400_CLASS_ID           =  -238400
      FRAME_-238400_CENTER             =  -238
      TKFRAME_-238400_RELATIVE         = 'SMART1_SPACECRAFT'
      TKFRAME_-238400_SPEC             = 'ANGLES'
      TKFRAME_-238400_UNITS            = 'DEGREES'
      TKFRAME_-238400_ANGLES           = (   0.000, -90.000,   0.000 )
      TKFRAME_-238400_AXES             = (   1,       2,       3     )


      FRAME_SMART1_KATE_KA             =  -238410
      FRAME_-238410_NAME               = 'SMART1_KATE_KA'
      FRAME_-238410_CLASS              =  4
      FRAME_-238410_CLASS_ID           =  -238410
      FRAME_-238410_CENTER             =  -238
      TKFRAME_-238410_RELATIVE         = 'SMART1_SPACECRAFT'
      TKFRAME_-238410_SPEC             = 'ANGLES'
      TKFRAME_-238410_UNITS            = 'DEGREES'
      TKFRAME_-238410_ANGLES           = (   0.000, -90.000,   0.000 )
      TKFRAME_-238410_AXES             = (   1,       2,       3     )

   \begintext


SIR frames:
========================================================================

   This section of the file contains the definitions of the SIR
   frames.


SIR Frame Tree
--------------------------------------

   The diagram below shows the SIR frame hierarchy.


                          "J2000" INERTIAL
       +---------------------------------------------------+
       |                         |                         |
       |                         |                         |
       |<-pck                    |                    pck->|
       |                         |                         |
       V                         |                         V
   "IAU_MOON"                    |                    "IAU_EARTH"
 MOON BODY-FIXED                 |                 EARTH BODY-FIXED
 ---------------                 |                 ----------------
                                 |
                                 |<-ck
                                 |
                                 V
                        "SMART1-SPACECRAFT"
                        -------------------
                                 |
                                 |
                                 |
                                 |<-fixed
                                 |
                                 V
                            "SMART1_SIR"
                            ------------



SIR Detector Frame
--------------------------------------

   Since SIR detector receive radiation through the prism and essentially
   has a single pixel in terms of spatial resolution, its frame, SMART1_SIR
   in such way that SIR boresight direction is nominally co-aligned with
   AMIE's boresight.

   The SIR Detector frame -- SMART1_SIR -- is defined as follows:

      -  +Z axis points along the camera boresight;

      -  +X axis is nominally co-aligned with the s/c +X axis;

      -  +Y axis completes the right hand frame;

      -  the origin of the frame is located at the fiber tip focal point.


   +Z s/c side view:
   -----------------
                                                                        
                                                                         
                                  _____ MGA                            
                                  \   /   
      .________________.     ._____\^/_____.     .________________.
      |                 \    |      |+Xsc  |    /                 |
      |                  \   |      |    ^ |   /                  |
      |                   |  +Ysc   |    |+Xsir                   |
      |                   |o<-------o    | |=o|                   |
      |                   |  |         ._|_|  .                   |
      |                  /   |    <------o |   \                  |
      ._________________/    .___+Ysir_.___.    \_________________.
       +Y Solar Array                     SIR       -Y Solar Array
                                          

                                             +Zsc and +Zsir are
                                                 out of page

   The following in-flight calibrated misalignment angles were provided
   in [5] and [7].

   The actual s/c +Z axis direction is specified in [5] as an offset from
   the AMIE boresight direction by the following two angles:

      Offset from Z AMIE: x (deg) =   0.537
      Offset from Z AMIE: y (deg) =   0.665

   These offset angles have been measured after performing the rotation
   about +Z amie axis.

   The actual SIR boresight direction is specified in [7] as an offset from
   the AMIE boresigth direction by the following two angles:

      Offset from Z AMIE: x (deg) =   0.502
      Offset from Z AMIE: y (deg) =   0.690


   The first of the two angles -- ``Offset Angle from Z AMIE: x'' -- is the
   angle between the projection of the boresight onto the AMIE XZ plane
   and the AMIE +Z axis, measured positive from the AMIE +Z toward the
   AMIE +X axis. The second of the two angles -- ``Offset Angle from Z AMIE:
   y'' -- is the angle between the projection of the boresight onto the
   AMIE YZ plane and the AMIE +Z axis, measured positive from the AMIE
   +Z toward the AMIE +Y axis.

   The actual SIR boresight can be specified as an offset from the s/c +Z
   axis direction by the following two angles, computed from the offsets
   given above:

      Offset from Z s/c: x (deg) =   0.502 - 0.537 =  -0.0350
      Offset from Z s/c: y (deg) =   0.690 - 0.665 =   0.0250
     
   The first of the two angles -- ``Offset Angle from Z s/c: x'' -- is the
   angle between the projection of the boresight onto the s/c XZ plane
   and the s/c +Z axis, measured positive from the s/c +Z toward the
   s/c +X axis. The second of the two angles -- ``Offset Angle from Z s/c:
   y'' -- is the angle between the projection of the boresight onto the
   s/c YZ plane and the s/c +Z axis, measured positive from the s/c
   +Z toward the s/c +Y axis.

   The following set of rotations can be applied to the s/c axes to
   align the SIR frame's +Z axis with the boresight defined by
   the angles above (rotation about +Z is not defined in [5] and
   assumed to be zero in this set of rotations):

      Msc->sir = [0.0]z * [-0.034999996668]y * [-0.0250]x
   
   These values are included in the definition below.

   Since the SPICE frames subsystem calls for specifying the reverse
   transformation--going from the instrument or structure frame to the
   base frame--as compared to the description given above, the order of
   rotations assigned to the TKFRAME_*_AXES keyword is also reversed
   compared to the above text, and the signs associated with the
   rotation angles assigned to the TKFRAME_*_ANGLES keyword are the
   opposite from what is written in the above text.   

   \begindata

      FRAME_SMART1_SIR                 =  -238200
      FRAME_-238200_NAME               = 'SMART1_SIR'
      FRAME_-238200_CLASS              =  4
      FRAME_-238200_CLASS_ID           =  -238200
      FRAME_-238200_CENTER             =  -238
      TKFRAME_-238200_RELATIVE         = 'SMART1_SPACECRAFT'
      TKFRAME_-238200_SPEC             = 'ANGLES'
      TKFRAME_-238200_UNITS            = 'DEGREES'
      TKFRAME_-238200_ANGLES           = ( 0.0250, 0.034999996668, 0.0 )
      TKFRAME_-238200_AXES             = ( 1,   2,   3   )

   \begintext


SPEDE frames:
========================================================================

   This section of the file contains the definitions of the Spacecraft 
   Potential, Electron and Dust Experiment frames. 

SPEDE Frame Tree
--------------------------------------

   The diagram below shows the XSM frame hierarchy.


                          "J2000" INERTIAL
       +---------------------------------------------------+
       |                         |                         |
       |                         |                         |
       |<-pck                    |                    pck->|
       |                         |                         |
       V                         |                         V
   "IAU_MOON"                    |                    "IAU_EARTH"
 MOON BODY-FIXED                 |                 EARTH BODY-FIXED
 ---------------                 |                 ----------------
                                 |         
                                 |<-ck
                                 |
                                 V 
                         "SMART1-SPACECRAFT"
                      +-----------------------+       
                      |                       |      
                      |                       |
                      |<-fixed                |<-fixed
                      |                       |
                      V                       V
               "SMART1_SPEDE+X"        "SMART1_SPEDE-X" 
               ----------------        ----------------     



SPEDE Boom Frames
--------------------------------------
   
   The Spacecraft Potential, Electron and Dust Experiment (SPEDE) consists
   in two symmetric booms rigidly attached to the +X and -X panels of the s/c
   bus. Therefore, the SPEDE frames, -- SMART1_SPEDE+X and SMART1_SPEDE-X
   -- are defined as fixed offset frames with their orientation given 
   relative to the spacecraft mechanical frame, SMART1_SPACECRAFT.

   The frames for the two SPEDE booms --  SPEDE+X and SPEDE-X -- are defined
   as follows:

      -  +Z axis points from the base of the boom to its tip, nominally
         aligned with the s/c X axis;

      -  +Y axis is nominally co-aligned with the s/c +Y axis;

      -  +X axis completes the right hand frame;

      -  the origin of the frame is located at the boom's tip. 

   SPEDE booms are rigidly mounted on the +X and -X spacecraft panels,
   respectively.

   This diagram illustrates the SMART1_SPEDE+X and SMART1_SPEDE-X frames:


   +Y s/c side view
   ----------------

                                ._____________.    ^
                                |             |    | +Xs-x
                                =======o========   |
                                |           SA+Y   |
                    +X SPEDE Boom    +Zsc     |    | +Ys-x
                   <-------o====|      ^      |====o-------> +Zs-x
                   +Zs+x   | +Ys+x     |      | -X SPEDE Boom
                           |    |      |      |
                           |    .______|______.
                     +Xs+x |      |    |    |
                           v   <-------o____.
                              +Xsc   / +Ysc
                                    /_____\
                                   Main Engine

                              +Ysc, +Ys+x and +Ys-x are out of the page.

   Nominally a single rotation of +90 degrees about the +Y axis is needed to
   co-align the s/c frame with the SPEDE+X frame. A single rotation of -90
   degrees about the +Y axis is required to co-align the s/c frame with the
   SPEDE-X frame.

   Since the SPICE frames subsystem calls for specifying the reverse
   transformation--going from the instrument or structure frame to the
   base frame--as compared to the description given above, the order of
   rotations assigned to the TKFRAME_*_AXES keyword is also reversed
   compared to the above text, and the signs associated with the
   rotation angles assigned to the TKFRAME_*_ANGLES keyword are the
   opposite from what is written in the above text.
      
   \begindata

      FRAME_SMART1_SPEDE+X             =  -238600
      FRAME_-238600_NAME               = 'SMART1_SPEDE+X'
      FRAME_-238600_CLASS              =  4
      FRAME_-238600_CLASS_ID           =  -238600
      FRAME_-238600_CENTER             =  -238
      TKFRAME_-238600_RELATIVE         = 'SMART1_SPACECRAFT'
      TKFRAME_-238600_SPEC             = 'ANGLES'
      TKFRAME_-238600_UNITS            = 'DEGREES'
      TKFRAME_-238600_ANGLES           = (   0.000,  -90.000,   0.000 )
      TKFRAME_-238600_AXES             = (   1,       2,       3     )

      FRAME_SMART1_SPEDE-X             =  -238610
      FRAME_-238610_NAME               = 'SMART1_SPEDE-X'
      FRAME_-238610_CLASS              =  4
      FRAME_-238610_CLASS_ID           =  -238610
      FRAME_-238610_CENTER             =  -238
      TKFRAME_-238610_RELATIVE         = 'SMART1_SPACECRAFT'
      TKFRAME_-238610_SPEC             = 'ANGLES'
      TKFRAME_-238610_UNITS            = 'DEGREES'
      TKFRAME_-238610_ANGLES           = (   0.000, 90.000,   0.000 )
      TKFRAME_-238610_AXES             = (   1,       2,       3     )

   \begintext


SMART-1 Mission NAIF ID Codes -- Definition Section
========================================================================

   This section contains name to NAIF ID mappings for the SMART-1 mission.


SMART-1 Spacecraft and instruments IDs:
-------------------------------------------------------------

   This table summarizes SMART-1 Spacecraft IDs:

            Name                   ID       Synonyms
            ---------------------  -------  ---------------------------
            SMART-1                -238     S1, SMART1, SM1 
   Notes:

      -- 'SM1', 'S1', 'SMART-1', 'SMART1' are
         synonyms and all map to the official SMART-1 s/c ID (-238);

   Name-ID Mapping keywords:

         \begindata

            NAIF_BODY_NAME += ( 'SM1' )
            NAIF_BODY_CODE += ( -238 )

            NAIF_BODY_NAME += ( 'S1' )
            NAIF_BODY_CODE += ( -238 )

            NAIF_BODY_NAME += ( 'SMART-1' )
            NAIF_BODY_CODE += ( -238 )

            NAIF_BODY_NAME += ( 'SMART1' )
            NAIF_BODY_CODE += ( -238 )

         \begintext


SMART-1 Spacecraft Structures IDs
--------------------------------------

   This table summarizes SMART-1 Spacecraft Structure IDs:

            Name                   ID       Synonyms
            ---------------------  -------  -------------------------
            SMART1_SPACECRAFT      -238000   SMART1_SC
            SMART1_SA+Y            -238010
            SMART1_SA+Y_BAPTA      -238011
            SMART1_SA+Y_C1         -238012
            SMART1_SA+Y_C2         -238013
            SMART1_SA+Y_C3         -238014
            SMART1_SA+Y_C4         -238015
            SMART1_SA-Y            -238020
            SMART1_SA-Y_BAPTA      -238021
            SMART1_SA-Y_C1         -238022
            SMART1_SA-Y_C2         -238023
            SMART1_SA-Y_C3         -238024
            SMART1_SA-Y_C4         -238025

            SMART1_MGA             -238030
            SMART1_LGA-1           -238040
            SMART1_LGA-2           -238050
            SMART1_SEPP            -238060
            SMART1_SS1             -238070
            SMART1_SS2             -238071
            SMART1_SS3             -238072

   Notes:

      -  'SMART1_SC' and 'SMART1_SPACECRAFT' are synonyms and all map to the
         SMART-1 s/c bus structure ID (-238000);

   Name-ID Mapping keywords:

         \begindata

            NAIF_BODY_NAME += ( 'SMART1_SPACECRAFT' )
            NAIF_BODY_CODE += ( -238000 )

            NAIF_BODY_NAME += ( 'SMART1_SC' )
            NAIF_BODY_CODE += ( -238000 )

            NAIF_BODY_NAME += ( 'SMART1_SA+Y' )
            NAIF_BODY_CODE += ( -238010 )

            NAIF_BODY_NAME += ( 'SMART1_SA+Y_BAPTA' )
            NAIF_BODY_CODE += ( -238011 )

            NAIF_BODY_NAME += ( 'SMART1_SA+Y_C1' )   
            NAIF_BODY_CODE += ( -238012 )

            NAIF_BODY_NAME += ( 'SMART1_SA+Y_C2' )   
            NAIF_BODY_CODE += ( -238013 )

            NAIF_BODY_NAME += ( 'SMART1_SA+Y_C3' )   
            NAIF_BODY_CODE += ( -238014 )

            NAIF_BODY_NAME += ( 'SMART1_SA+Y_C4' )   
            NAIF_BODY_CODE += ( -238015 )

            NAIF_BODY_NAME += ( 'SMART1_SA-Y' )
            NAIF_BODY_CODE += ( -238020 )

            NAIF_BODY_NAME += ( 'SMART1_SA-Y_BAPTA' )
            NAIF_BODY_CODE += ( -238021 )

            NAIF_BODY_NAME += ( 'SMART1_SA-Y_C1' )   
            NAIF_BODY_CODE += ( -238022 )

            NAIF_BODY_NAME += ( 'SMART1_SA-Y_C2' )   
            NAIF_BODY_CODE += ( -238023 )

            NAIF_BODY_NAME += ( 'SMART1_SA-Y_C3' )   
            NAIF_BODY_CODE += ( -238024 )

            NAIF_BODY_NAME += ( 'SMART1_SA-Y_C4' )   
            NAIF_BODY_CODE += ( -238025 )

            NAIF_BODY_NAME += ( 'SMART1_MGA' )
            NAIF_BODY_CODE += ( -238030 )

            NAIF_BODY_NAME += ( 'SMART1_LGA-1' )
            NAIF_BODY_CODE += ( -238040 )

            NAIF_BODY_NAME += ( 'SMART1_LGA-2' )
            NAIF_BODY_CODE += ( -238050 )

            NAIF_BODY_NAME += ( 'SMART1_SEPP' )
            NAIF_BODY_CODE += ( -238060 )

            NAIF_BODY_NAME += ( 'SMART1_SS1' )
            NAIF_BODY_CODE += ( -238070 )

            NAIF_BODY_NAME += ( 'SMART1_SS2' )
            NAIF_BODY_CODE += ( -238071 )

            NAIF_BODY_NAME += ( 'SMART1_SS3' )
            NAIF_BODY_CODE += ( -238072 )


         \begintext


AMIE IDs
--------------------------------------

   This table summarizes AMIE IDs:

            Name                   ID
            ---------------------  -------
            SMART1_AMIE_CCD        -238100

            SMART1_AMIE_NONE       -238110
            SMART1_AMIE_LASER      -238120
            SMART1_AMIE_VIS_X      -238130
            SMART1_AMIE_VIS_Y      -238131
            SMART1_AMIE_FEL_X      -238140
            SMART1_AMIE_FEL_Y      -238141
            SMART1_AMIE_FEH_X      -238150
            SMART1_AMIE_FEH_Y      -238151


   Name-ID Mapping keywords:

         \begindata

            NAIF_BODY_NAME += ( 'SMART1_AMIE_CCD' )
            NAIF_BODY_CODE += ( -238100 )

            NAIF_BODY_NAME += ( 'SMART1_AMIE_NONE' )
            NAIF_BODY_CODE += ( -238110 )

            NAIF_BODY_NAME += ( 'SMART1_AMIE_LASER' )
            NAIF_BODY_CODE += ( -238120 )

            NAIF_BODY_NAME += ( 'SMART1_AMIE_VIS_X' )
            NAIF_BODY_CODE += ( -238130 )

            NAIF_BODY_NAME += ( 'SMART1_AMIE_VIS_Y' )
            NAIF_BODY_CODE += ( -238131 )

            NAIF_BODY_NAME += ( 'SMART1_AMIE_FEL_X' )
            NAIF_BODY_CODE += ( -238140 )

            NAIF_BODY_NAME += ( 'SMART1_AMIE_FEL_Y' )
            NAIF_BODY_CODE += ( -238141 )

            NAIF_BODY_NAME += ( 'SMART1_AMIE_FEH_X' )
            NAIF_BODY_CODE += ( -238150 )

            NAIF_BODY_NAME += ( 'SMART1_AMIE_FEH_Y' )
            NAIF_BODY_CODE += ( -238151 )

         \begintext


D-CIXS IDs
--------------------------------------

   This table summarizes D-CIXS IDs:

            Name                   ID
            ---------------------  -------
            SMART1_DCIXS_BASE      -238300
            SMART1_DCIXS_FACET1    -238310
            SMART1_DCIXS_FACET2    -238320
            SMART1_DCIXS_FACET3    -238330


   Name-ID Mapping keywords:

         \begindata

            NAIF_BODY_NAME += ( 'SMART1_DCIXS_BASE' )
            NAIF_BODY_CODE += ( -238300 )

            NAIF_BODY_NAME += ( 'SMART1_DCIXS_FACET1' )
            NAIF_BODY_CODE += ( -238310 )

            NAIF_BODY_NAME += ( 'SMART1_DCIXS_FACET2' )
            NAIF_BODY_CODE += ( -238320 )

            NAIF_BODY_NAME += ( 'SMART1_DCIXS_FACET3' )
            NAIF_BODY_CODE += ( -238330 )

         \begintext


EPDP IDs
--------------------------------------

   This table summarizes EPDP IDs:

            Name                   ID
            ---------------------  -------

   Name-ID Mapping keywords:

         \begindata

            NAIF_BODY_NAME += ( '111' )
            NAIF_BODY_CODE += ( 111 )

         \begintext


KATE/RSIS IDs
--------------------------------------

   This table summarizes KATE/RSIS IDs:

            Name                   ID
            ---------------------  -------
            SMART1_KATE_X         -238400
            SMART1_KATE_KA        -238410

   Name-ID Mapping keywords:

         \begindata

            NAIF_BODY_NAME += ( 'SMART1_KATE_X' )
            NAIF_BODY_CODE += ( -238400 )

            NAIF_BODY_NAME += ( 'SMART1_KATE_KA' )
            NAIF_BODY_CODE += ( -238410 )

         \begintext


SIR IDs
--------------------------------------

   This table summarizes SIR IDs:

            Name                   ID
            ---------------------  -------
            SMART1_SIR             -238200

   Name-ID Mapping keywords:

         \begindata

            NAIF_BODY_NAME += ( 'SMART1_SIR' )
            NAIF_BODY_CODE += ( -238200 )

         \begintext


SPEDE IDs
--------------------------------------

   This table summarizes SPEDE IDs:

            Name                   ID
            ---------------------  -------
            SMART1_SPEDE+X         -238600
            SMART1_SPEDE-X         -238610

   Name-ID Mapping keywords:

         \begindata

            NAIF_BODY_NAME += ( 'SMART1_SPEDE+X' )
            NAIF_BODY_CODE += ( -238600 )

            NAIF_BODY_NAME += ( 'SMART1_SPEDE-X' )
            NAIF_BODY_CODE += ( -238610 )

         \begintext

XSM IDs
--------------------------------------

   This table summarizes XSM IDs:

            Name                   ID
            ---------------------  -------
            SMART1_XSM             -238700

   Name-ID Mapping keywords:

         \begindata

            NAIF_BODY_NAME += ( 'SMART1_XSM' )
            NAIF_BODY_CODE += ( -238700 )

         \begintext
