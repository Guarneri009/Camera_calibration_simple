PROJECT_ROOT = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

CC            = g++
#CFLAGS        = -std=c++1y -O0 -g3 -Wall -fmessage-length=0 -Wunused-function -MMD -MP -MF -MT
CFLAGS        = -std=c++1y -O0 -g3 -Wall -fmessage-length=0 -MMD -MP -MF -MT -Wno-unused-function -Wno-unused-variable
DEST          = .
LDFLAGS       = -I/usr/include/eigen3
SYMBOLES      = -DCHESSBOARD -DVSCODE
LIBSW         = -lpthread -lrt -lXxf86vm -lX11 -ldl -lXi -lGLU -lGL
LIBSCV1       = -lopencv_core
LIBSCV2       = -lopencv_videoio -lopencv_imgcodecs -lopencv_highgui -lopencv_imgproc -lopencv_ml
LIBSCV3       = -lopencv_objdetect -lopencv_photo -lopencv_stitching -lopencv_superres -lopencv_video
LIBSCV4       = -lopencv_flann -lopencv_calib3d -lopencv_features2d
CVCONTRIB     = -lopencv_datasets -lopencv_xfeatures2d  -lopencv_text
OBJS          = $(PROJECT_ROOT)camera_calibration.cpp
PROGRAM       = main

all:           $(PROGRAM)

$(PROGRAM):    $(OBJS)
	$(CC) $(CFLAGS) $(SYMBOLES) $(LDFLAGS) $(OBJS) -o $(PROGRAM) $(LIBSW) $(LIBSCV1) $(LIBSCV2) $(LIBSCV3) $(LIBSCV4) $(CVCONTRIB)

clean:
	rm -f *.o *~ $(PROGRAM)

docs:
	doxygen doxygen-config
