Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D61A1BEB2C
	for <lists+linux-clk@lfdr.de>; Thu, 30 Apr 2020 00:02:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727070AbgD2WBZ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 29 Apr 2020 18:01:25 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:16508 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726554AbgD2WBY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 Apr 2020 18:01:24 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ea9f9270001>; Wed, 29 Apr 2020 15:01:11 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 29 Apr 2020 15:01:23 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Wed, 29 Apr 2020 15:01:23 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 29 Apr
 2020 22:01:23 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 29 Apr 2020 22:01:23 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.165.152]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5ea9f9310000>; Wed, 29 Apr 2020 15:01:22 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v11 0/9] Add Tegra driver for video capture
Date:   Wed, 29 Apr 2020 14:59:57 -0700
Message-ID: <1588197606-32124-1-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1588197671; bh=gW8+9GV4sSQoD2i/SWykJpy9X9egVwA8+r5qPJ5A8VE=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=GeH0EfpBDp939biIHJtzlMPR73VHYFUmUsaEAAwVWoi2xFJ64PEMB2eVDQMT8kQZS
         hFGu/7oVfV2frRpDQ4R+lCsFjJ0pokVp73aXrTl4zOC5bPWiWPOkM8HWEYceEvqoVc
         X20tVecGa+HXLagNqfzwlAMDp4vwzbaTh20JqNfvwKBS9Ov/+Y/z+b2F7Rdv/lJR9a
         CKxjPA3mZ4fQyjRkOjSoFz3OQoioxALC7BWQHHHc47P4OfE2S9r9fD5RaFE8BPBoNB
         Ph4dFTMF2/11HDqGfjifdcpimtuQIcUZ7wPy/0VNzpwX6JW6xuv0NwBfn62oGGeY6V
         UqHEz3/d98oLA==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This series adds Tegra210 VI and CSI driver for built-in test pattern
generator (TPG) capture.

Tegra210 supports max 6 channels on VI and 6 ports on CSI where each
CSI port is one-to-one mapped to VI channel for video capture.

This series has TPG support only where it creates hard media links
between CSI subdevice and VI video device without device graphs.

v4l2-compliance results are available below the patch diff.

[v11]:  Includes,
	- v10 feedback

[v10]:	Includes,
	- updated patches for latest linux-next base
	- Kconfig update
	- minor cleanup/improvements

[v9]:	Includes,
	- small fix to explicitly check for both vi and csi channels
	  availability before TPG setup and cleanup so in the cases
	  of later Tegras where CSI is not child to VI and if either
	  of the platform drivers are not registered, TPG setup will be
	  skipped.

[v8]:	Includes,
	- minor change to use device managed allocation fo vi and csi for now.
	  May need to change back to non device managed allocation later when
	  support for direct host1x client driver unbind and bind is added.

[v7]:	Includes,
	- v6 feedback
	- moved registering v4l2 nodes and creating tpg media links to happen
	  after both host1x client inits so during direct host1x client driver
	  unbind and bind order of client unregister/register will not impact.
	- All channels resources and freeing happens during v4l2 device release
	  callback.
	- module unload/load works with below host1x bus driver fix.
	  http://patchwork.ozlabs.org/patch/1268191/

[v6]:	Includes,
	- v5 feedback
	- fix for csi_tpg clock parent
	- fix to free channel resources in video device release callback
	  for registered video devices as resource might still be in use
	  when application holds handle to it during driver unbind.
	- added blanking intervals based on resolution and bpp for csi
	  internal tpg.
	- added implementation for subdev pad ops enum_frame_size and
	  enum_frame_interval.

[v5]:	Includes,
	- v4 feedback
	- fix for venc powergate mc reset order.
	- fix to have unbind and bind work during v4l2-ctl sleep and streaming.

[v4]:	Includes,
	- v3 feedback changes and some improvements
	- Fixes tegra_channel_buffer struct to use v4l2 buffer as first
	  member. This also fixes crash of unable to handle kernel write
	  to read-only memory.
	- Uses separate host1x sync ids for frame start and memory write
	  ack as single sync id for both can cause sync loss between exact
	  frame start and memory write ack events.
	- Uses client managed host1x syncpoints.
	- Includes fix to increment syncpoint counter to match cached value
	  to synchronize in case of timeouts or missed hardware triggers.
	- Frame start and memory write ack syncpoint FIFO's are of size 2.
	  So, updated capture logic to avoid adding more than 2 sync point
	  condition requests to FIFOs to avoid overflow.
	- Implemented PM ops for runtime suspend and resume along with generic
	  power domains to allow proper power gate and ungate sequencing along
	  with MC VI flush during power gate.
	- Fixed Tegra210 device tree sor power domain clocks.
	- Added missing reset-cells to mc node.

[v3]:	Includes,
	- video device node handling set/get formats of all devices
	  in the pipeline.
	- Removed subdev nodes.
	- Fixed frame sync timeout issue due to CSI clocks not properly
	  set for corresponding blocks.
	- uses minimum 3 buffers to be queued to fixed memory race between
	  DMA writes and userspace reads causing kernel hang reporting
	  kernel write to read-only memory.
	- Improved capture threads and done threads to avoid possible
	  race conditions and added recovery in case of frame sync timeout.
	- Passes all the V4L compliance tests.

[v2]:	Includes,
	- v0 feedback
	- Merged files to have Tegra specific separately
	- Moved CSI device as child to VI as Tegra210 CSI is
	  part of VI sharing same host interface and register
	  space.
	- Added link_validate for format validation.
	- Fixes for passing v4l2-compliance for media, video,
	  and subdevices.

[v1]:	Includes,
	- Adds CSI TPG clock to Tegra210 clock driver
	- Host1x video driver with VI and CSI clients.
	- Support for Tegra210 only.
	- VI CSI TPG support with hard media links in driver.
	- Video formats supported by Tegra210 VI
	- CSI TPG supported video formats


Sowjanya Komatineni (9):
  arm64: tegra: Fix sor powergate clocks and reset
  arm64: tegra: Add reset-cells to mc
  dt-bindings: clock: tegra: Add clk id for CSI TPG clock
  clk: tegra: Add Tegra210 CSI TPG clock gate
  dt-binding: tegra: Add VI and CSI bindings
  media: tegra: Add Tegra210 Video input driver
  MAINTAINERS: Add Tegra Video driver section
  dt-bindings: reset: Add ID for Tegra210 VI reset
  arm64: tegra: Add Tegra VI CSI support in device tree

 .../display/tegra/nvidia,tegra20-host1x.txt        |   73 +-
 MAINTAINERS                                        |   10 +
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |   10 +
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |   52 +-
 drivers/clk/tegra/clk-tegra210.c                   |    7 +
 drivers/staging/media/Kconfig                      |    2 +
 drivers/staging/media/Makefile                     |    1 +
 drivers/staging/media/tegra-video/Kconfig          |   12 +
 drivers/staging/media/tegra-video/Makefile         |    8 +
 drivers/staging/media/tegra-video/TODO             |   10 +
 drivers/staging/media/tegra-video/csi.c            |  535 ++++++++++
 drivers/staging/media/tegra-video/csi.h            |  144 +++
 drivers/staging/media/tegra-video/tegra210.c       | 1007 ++++++++++++++++++
 drivers/staging/media/tegra-video/vi.c             | 1078 ++++++++++++++++++++
 drivers/staging/media/tegra-video/vi.h             |  256 +++++
 drivers/staging/media/tegra-video/video.c          |  155 +++
 drivers/staging/media/tegra-video/video.h          |   29 +
 include/dt-bindings/clock/tegra210-car.h           |    2 +-
 include/dt-bindings/reset/tegra210-car.h           |    1 +
 19 files changed, 3375 insertions(+), 17 deletions(-)
 create mode 100644 drivers/staging/media/tegra-video/Kconfig
 create mode 100644 drivers/staging/media/tegra-video/Makefile
 create mode 100644 drivers/staging/media/tegra-video/TODO
 create mode 100644 drivers/staging/media/tegra-video/csi.c
 create mode 100644 drivers/staging/media/tegra-video/csi.h
 create mode 100644 drivers/staging/media/tegra-video/tegra210.c
 create mode 100644 drivers/staging/media/tegra-video/vi.c
 create mode 100644 drivers/staging/media/tegra-video/vi.h
 create mode 100644 drivers/staging/media/tegra-video/video.c
 create mode 100644 drivers/staging/media/tegra-video/video.h


v4l2-compliance SHA: 81e45d957c4db39397f893100b3d2729ef39b052, 32 bits, 32-bit time_t

Compliance test for tegra-video device /dev/media0:

Media Driver Info:
        Driver name      : tegra-video
        Model            : NVIDIA Tegra Video Input Device
        Serial           : 
        Bus info         : platform:54080000.vi
        Media version    : 5.6.0
        Hardware revision: 0x00000003 (3)
        Driver version   : 5.6.0

Required ioctls:
        test MEDIA_IOC_DEVICE_INFO: OK

Allow for multiple opens:
        test second /dev/media0 open: OK
        test MEDIA_IOC_DEVICE_INFO: OK
        test for unlimited opens: OK

Media Controller ioctls:
        test MEDIA_IOC_G_TOPOLOGY: OK
        Entities: 12 Interfaces: 6 Pads: 12 Links: 12
        test MEDIA_IOC_ENUM_ENTITIES/LINKS: OK
        test MEDIA_IOC_SETUP_LINK: OK
        test invalid ioctls: OK

Total for tegra-video device /dev/media0: 8, Succeeded: 8, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for tegra-video device /dev/video0:

Driver Info:
        Driver name      : tegra-video
        Card type        : 54080000.vi-output-0
        Bus info         : platform:54080000.vi
        Driver version   : 5.6.0
        Capabilities     : 0x85200001
                Video Capture
                Read/Write
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x05200001
                Video Capture
                Read/Write
                Streaming
                Extended Pix Format
Media Driver Info:
        Driver name      : tegra-video
        Model            : NVIDIA Tegra Video Input Device
        Serial           : 
        Bus info         : platform:54080000.vi
        Media version    : 5.6.0
        Hardware revision: 0x00000003 (3)
        Driver version   : 5.6.0
Interface Info:
        ID               : 0x03000003
        Type             : V4L Video
Entity Info:
        ID               : 0x00000001 (1)
        Name             : 54080000.vi-output-0
        Function         : V4L2 I/O
        Pad 0x01000002   : 0: Sink
          Link 0x02000007: from remote pad 0x1000006 of entity 'tpg-0': Data, Enabled

Required ioctls:
        test MC information (see 'Media Driver Info' above): OK
        test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
        test second /dev/video0 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

        test invalid ioctls: OK
Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 1 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Input 0):
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 2 Private Controls: 0

Format ioctls (Input 0):
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls (Input 0):
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)

Test input 0:

Streaming ioctls:
        test read/write: OK
        test blocking wait: OK
        test MMAP (no poll): OK                           
        test MMAP (select): OK                            
        test MMAP (epoll): OK                             
        test USERPTR (no poll): OK (Not Supported)
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for tegra-video device /dev/video0: 53, Succeeded: 53, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for tegra-video device /dev/video1:

Driver Info:
        Driver name      : tegra-video
        Card type        : 54080000.vi-output-1
        Bus info         : platform:54080000.vi
        Driver version   : 5.6.0
        Capabilities     : 0x85200001
                Video Capture
                Read/Write
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x05200001
                Video Capture
                Read/Write
                Streaming
                Extended Pix Format
Media Driver Info:
        Driver name      : tegra-video
        Model            : NVIDIA Tegra Video Input Device
        Serial           : 
        Bus info         : platform:54080000.vi
        Media version    : 5.6.0
        Hardware revision: 0x00000003 (3)
        Driver version   : 5.6.0
Interface Info:
        ID               : 0x0300000b
        Type             : V4L Video
Entity Info:
        ID               : 0x00000009 (9)
        Name             : 54080000.vi-output-1
        Function         : V4L2 I/O
        Pad 0x0100000a   : 0: Sink
          Link 0x0200000f: from remote pad 0x100000e of entity 'tpg-1': Data, Enabled

Required ioctls:
        test MC information (see 'Media Driver Info' above): OK
        test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
        test second /dev/video1 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

        test invalid ioctls: OK
Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 1 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Input 0):
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 2 Private Controls: 0

Format ioctls (Input 0):
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls (Input 0):
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)

Test input 0:

Streaming ioctls:
        test read/write: OK
        test blocking wait: OK
        test MMAP (no poll): OK                           
        test MMAP (select): OK                            
        test MMAP (epoll): OK                             
        test USERPTR (no poll): OK (Not Supported)
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for tegra-video device /dev/video1: 53, Succeeded: 53, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for tegra-video device /dev/video2:

Driver Info:
        Driver name      : tegra-video
        Card type        : 54080000.vi-output-2
        Bus info         : platform:54080000.vi
        Driver version   : 5.6.0
        Capabilities     : 0x85200001
                Video Capture
                Read/Write
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x05200001
                Video Capture
                Read/Write
                Streaming
                Extended Pix Format
Media Driver Info:
        Driver name      : tegra-video
        Model            : NVIDIA Tegra Video Input Device
        Serial           : 
        Bus info         : platform:54080000.vi
        Media version    : 5.6.0
        Hardware revision: 0x00000003 (3)
        Driver version   : 5.6.0
Interface Info:
        ID               : 0x03000013
        Type             : V4L Video
Entity Info:
        ID               : 0x00000011 (17)
        Name             : 54080000.vi-output-2
        Function         : V4L2 I/O
        Pad 0x01000012   : 0: Sink
          Link 0x02000017: from remote pad 0x1000016 of entity 'tpg-2': Data, Enabled

Required ioctls:
        test MC information (see 'Media Driver Info' above): OK
        test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
        test second /dev/video2 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

        test invalid ioctls: OK
Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 1 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Input 0):
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 2 Private Controls: 0

Format ioctls (Input 0):
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls (Input 0):
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)

Test input 0:

Streaming ioctls:
        test read/write: OK
        test blocking wait: OK
        test MMAP (no poll): OK                           
        test MMAP (select): OK                            
        test MMAP (epoll): OK                             
        test USERPTR (no poll): OK (Not Supported)
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for tegra-video device /dev/video2: 53, Succeeded: 53, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for tegra-video device /dev/video3:

Driver Info:
        Driver name      : tegra-video
        Card type        : 54080000.vi-output-3
        Bus info         : platform:54080000.vi
        Driver version   : 5.6.0
        Capabilities     : 0x85200001
                Video Capture
                Read/Write
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x05200001
                Video Capture
                Read/Write
                Streaming
                Extended Pix Format
Media Driver Info:
        Driver name      : tegra-video
        Model            : NVIDIA Tegra Video Input Device
        Serial           : 
        Bus info         : platform:54080000.vi
        Media version    : 5.6.0
        Hardware revision: 0x00000003 (3)
        Driver version   : 5.6.0
Interface Info:
        ID               : 0x0300001b
        Type             : V4L Video
Entity Info:
        ID               : 0x00000019 (25)
        Name             : 54080000.vi-output-3
        Function         : V4L2 I/O
        Pad 0x0100001a   : 0: Sink
          Link 0x0200001f: from remote pad 0x100001e of entity 'tpg-3': Data, Enabled

Required ioctls:
        test MC information (see 'Media Driver Info' above): OK
        test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
        test second /dev/video3 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

        test invalid ioctls: OK
Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 1 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Input 0):
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 2 Private Controls: 0

Format ioctls (Input 0):
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls (Input 0):
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)

Test input 0:

Streaming ioctls:
        test read/write: OK
        test blocking wait: OK
        test MMAP (no poll): OK                           
        test MMAP (select): OK                            
        test MMAP (epoll): OK                             
        test USERPTR (no poll): OK (Not Supported)
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for tegra-video device /dev/video3: 53, Succeeded: 53, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for tegra-video device /dev/video4:

Driver Info:
        Driver name      : tegra-video
        Card type        : 54080000.vi-output-4
        Bus info         : platform:54080000.vi
        Driver version   : 5.6.0
        Capabilities     : 0x85200001
                Video Capture
                Read/Write
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x05200001
                Video Capture
                Read/Write
                Streaming
                Extended Pix Format
Media Driver Info:
        Driver name      : tegra-video
        Model            : NVIDIA Tegra Video Input Device
        Serial           : 
        Bus info         : platform:54080000.vi
        Media version    : 5.6.0
        Hardware revision: 0x00000003 (3)
        Driver version   : 5.6.0
Interface Info:
        ID               : 0x03000023
        Type             : V4L Video
Entity Info:
        ID               : 0x00000021 (33)
        Name             : 54080000.vi-output-4
        Function         : V4L2 I/O
        Pad 0x01000022   : 0: Sink
          Link 0x02000027: from remote pad 0x1000026 of entity 'tpg-4': Data, Enabled

Required ioctls:
        test MC information (see 'Media Driver Info' above): OK
        test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
        test second /dev/video4 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

        test invalid ioctls: OK
Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 1 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Input 0):
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 2 Private Controls: 0

Format ioctls (Input 0):
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls (Input 0):
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)

Test input 0:

Streaming ioctls:
        test read/write: OK
        test blocking wait: OK
        test MMAP (no poll): OK                           
        test MMAP (select): OK                            
        test MMAP (epoll): OK                             
        test USERPTR (no poll): OK (Not Supported)
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for tegra-video device /dev/video4: 53, Succeeded: 53, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for tegra-video device /dev/video5:

Driver Info:
        Driver name      : tegra-video
        Card type        : 54080000.vi-output-5
        Bus info         : platform:54080000.vi
        Driver version   : 5.6.0
        Capabilities     : 0x85200001
                Video Capture
                Read/Write
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x05200001
                Video Capture
                Read/Write
                Streaming
                Extended Pix Format
Media Driver Info:
        Driver name      : tegra-video
        Model            : NVIDIA Tegra Video Input Device
        Serial           : 
        Bus info         : platform:54080000.vi
        Media version    : 5.6.0
        Hardware revision: 0x00000003 (3)
        Driver version   : 5.6.0
Interface Info:
        ID               : 0x0300002b
        Type             : V4L Video
Entity Info:
        ID               : 0x00000029 (41)
        Name             : 54080000.vi-output-5
        Function         : V4L2 I/O
        Pad 0x0100002a   : 0: Sink
          Link 0x0200002f: from remote pad 0x100002e of entity 'tpg-5': Data, Enabled

Required ioctls:
        test MC information (see 'Media Driver Info' above): OK
        test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
        test second /dev/video5 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

        test invalid ioctls: OK
Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 1 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Input 0):
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 2 Private Controls: 0

Format ioctls (Input 0):
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls (Input 0):
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)

Test input 0:

Streaming ioctls:
        test read/write: OK
        test blocking wait: OK
        test MMAP (no poll): OK                           
        test MMAP (select): OK                            
        test MMAP (epoll): OK                             
        test USERPTR (no poll): OK (Not Supported)
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for tegra-video device /dev/video5: 53, Succeeded: 53, Failed: 0, Warnings: 0

Grand Total for tegra-video device /dev/media0: 326, Succeeded: 326, Failed: 0, Warnings: 0

-- 
2.7.4

