Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5A1E430F71
	for <lists+linux-clk@lfdr.de>; Mon, 18 Oct 2021 07:04:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229836AbhJRFHG (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 18 Oct 2021 01:07:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbhJRFHG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 18 Oct 2021 01:07:06 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C40CC06161C;
        Sun, 17 Oct 2021 22:04:56 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id i5so4145398pla.5;
        Sun, 17 Oct 2021 22:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=GiM2cyw67H/R2I6ta66xen4e8soWABzwxBduTKOxug0=;
        b=PNs/Fb5o5gObMaB2VFNkPjkie7QDZs0po6FuKDLDJ4njr9RAJlrNlmGHShrR36nA8b
         HuHlwLG0O+H45f3M+qKkGVykzI1c4h7xoDPFvvvn/oEme4xRfwD7Qp3yxB+oPKWy/lsF
         tPVN0oIKQnAMM4y7b+p2u1H99f2qCgSBUDjxGYm1zV17KOToNkjcU7dvLkwFWssmKn0T
         OzM1vHi16XB/oVU/vycJgPFIn/6QpiVgMzUEF1YrC1B6SA7aEPcTJe3kBpps06MQNqR5
         EQTk5ZfC0SdI1gz3idv7258mW9K+yC83xdeMIs9dAdRO8GLaFpxSwwU4IiqeRfmgGdKm
         1mWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=GiM2cyw67H/R2I6ta66xen4e8soWABzwxBduTKOxug0=;
        b=Jl1hsd+BsvyRFp9+ak89R0KrM/kc76cjsAI5PB83/PLmgYWysKyAqCoMMAd/wOZn9Y
         eq7kVt1l/kx3cwy1SdtJTJRMaAr5TLuK0nI2wH5WxGBuQUsZhTuwouWuWNAY4hD72BJU
         mx/ErUMdbRwOO84aA5ouMdLSqE5WQPZs0/Yy6Z4x4dbYYxQn19DE3dMFlM4mhjbqosrD
         YziBZ+DvmhT6Sjq7pDnZAeuUGMDZ9HRYS7ohiOJiYx2ix0Wax4O3BWaC1PR+2EKyuXCn
         7hs3UpyU3o3ifDISdfWsGL1Q7DYZ4bD0lLyxHQ3kdEN+RP6K9e6Fu9phrs+XWaYaTALx
         T9qQ==
X-Gm-Message-State: AOAM531mFzOB/kF+JHUQCpCx5p/fDr3z34qgDC9Xu4K8h4wk5MhcxrST
        PCpw3rxM1RVtKVscBd/WaFw=
X-Google-Smtp-Source: ABdhPJw7pAH7ihHyv7dRMb3GkHs6fxsT8VVFdQOZj7lgLCMklQOp0Ygr6SP6qVS1UqxaHEGRxgin6g==
X-Received: by 2002:a17:902:d904:b0:13f:398e:a0df with SMTP id c4-20020a170902d90400b0013f398ea0dfmr24947032plz.47.1634533495178;
        Sun, 17 Oct 2021 22:04:55 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id c205sm11416625pfc.43.2021.10.17.22.04.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 17 Oct 2021 22:04:54 -0700 (PDT)
From:   dillon.minfei@gmail.com
To:     mchehab@kernel.org, mchehab+huawei@kernel.org,
        hverkuil-cisco@xs4all.nl, ezequiel@collabora.com, gnurou@gmail.com,
        pihsun@chromium.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org, gabriel.fernandez@st.com,
        gabriel.fernandez@foss.st.com
Cc:     patrice.chotard@foss.st.com, hugues.fruchet@foss.st.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Dillon Min <dillon.minfei@gmail.com>
Subject: [PATCH v5 00/10] Add support for DMA2D of STMicroelectronics STM32 Soc series
Date:   Mon, 18 Oct 2021 13:04:38 +0800
Message-Id: <1634533488-25334-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Dillon Min <dillon.minfei@gmail.com>

This patchset introduces a basic support for DMA2D Interface
of STMicroelectronics STM32 SoC series.

This first basic support implements R2M, M2M, M2M_PFC
M2M_BLEND support will be added later on.

This has been tested on STM32469-DISCO board.

history
v5:
- rebase to media_tree https://git.linuxtv.org/media_tree.git/
- remove unused log from dma2d driver to avoid spam kernel log.
- fix 0xFFFFFF to 0xffffff, 2^24 to 2^24 -1, etc.
- introduce patch "media: v4l2-ctrls: Add V4L2_CID_COLORFX_CBCR max setting"
  to add V4L2_CID_COLORFX_CBCR entry.
- thanks to Hans's patch, open nullptr check in v4l2-compliance, update new
  test result. thanks.
  https://lore.kernel.org/linux-media/3acd9ee4-5a58-6ed4-17fe-61596a5252b8@xs4all.nl/

v4 link:
https://lore.kernel.org/lkml/bc8e1cd1-0013-9062-88b6-fddca535919f@xs4all.nl/

v4:
- replace V4L2_COLORFX_SET_ARGB, V4L2_CID_COLORFX_ARGB to
  V4L2_COLORFX_SET_RGB, V4L2_CID_COLORFX_RGB since Alpha paramter not used
  in current. thanks Hans.
v3 link:
https://lore.kernel.org/lkml/1633689012-14492-1-git-send-email-dillon.minfei@gmail.com/

v3:
- use V4L2_COLORFX_SET_ARGB, V4L2_CID_COLORFX_ARGB to pass argb paramter to
  the dma2d driver, instead of add stm32 private ioctl.
- some v2's patch are removed in this version.
  - "[PATCH v2 7/9] media: docs: add doc for the stm32 dma2d driver"
  - "[PATCH v2 8/9] media: v4l: uapi: Add user control base for stm32 dma2d
    controls"
- dma2d's driver changes based on Hans's review result. detail can be found at
  "media: stm32-dma2d: STM32 DMA2D driver"
- add stm32 clk drivers bugfix, ltdc clock disabled after kenerl boot up.
v3 based on kernel and v4l-utils git:

kernel:
commit 9e1ff307c779ce1f0f810c7ecce3d95bbae40896
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun Oct 3 14:08:47 2021 -0700

    Linux 5.15-rc4

v4l-utils:
commit 700f5ded9c6de2c6dfe5d1b453d85566f95b4f0c
Author: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Date:   Sat Oct 2 11:01:05 2021 +0200

    test-media: show version info earlier and show cmd args

    Log the version info earlier and also log the command line arguments.
 
    Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

v2 link:
https://lore.kernel.org/lkml/1626341068-20253-11-git-send-email-dillon.minfei@gmail.com/


v2:
- update v4l2-compliance to SHA: a4f2e3a6f306 2021-07-13 08:04:15
  the test results at below [1].
- introduce Documentation/userspace-api/media/drivers/stm32-uapi.rst
  to explain the detail of dma2d's ioctl.
- reserved 16 ioctls from v4l2-controls.h for stm32, introduce stm32-media.h.
- collect Reviewed-by tag from Rob Herring.
- update dma2d driver from Hans's review. the details can be found
  at related patches.
v1 link:
https://lore.kernel.org/lkml/1621508727-24486-1-git-send-email-dillon.minfei@gmail.com/

v1:
The commit based on kernel(master): c3d0e3fd41b7f0f5d5d5b6022ab7e813f04ea727

Note for v4l2-compliance tool on nu-mmu platform:
I add two change based on v4l-utils since commit:
f0c7e3d71eaf4182bae7eb3ee0e43b4eeb047ea9

- change fork() to vfork() in v4l2-test-controls.cpp
  since no-mmu platform don't include fork().

with v4l2-compliance test log (with above modification):
since the stm32f469-disco ram limitation, there are 25 failed on
dma_alloc_coherent()

Really appreciate if someone can help to test this patch on the STM32429I-EVAL
evaluation board (https://www.st.com/en/evaluation-tools/stm32429i-eval.html)
8M x 32-bit SDRAM, 1M x 16-bit SRAM and 8M x 16-bit NOR Flash

~ # v4l2-compliance -f -d /dev/video0 > /dev/ttyprintk
[ 1798.550690] [U] v4l2-compliance 1.21.0-4855, 32 bits, 32-bit time_t
[ 1799.527504] [U] v4l2-compliance SHA: 700f5ded9c6d 2021-10-02 09:01:05
[ 1800.534558] [U] Compliance test for stm-dma2d device /dev/video0:
[ 1801.514999] [U] Driver Info:
[ 1801.998840] [U]      Driver name      : stm-dma2d
[ 1802.482151] [U]      Card type        : stm-dma2d
[ 1802.959808] [U]      Bus info         : platform:stm-dma2d
[ 1803.435715] [U]      Driver version   : 5.15.0
[ 1803.904938] [U]      Capabilities     : 0x84208000
[ 1804.371290] [U]              Video Memory-to-Memory
[ 1804.830870] [U]              Streaming
[ 1805.281465] [U]              Extended Pix Format
[ 1805.733249] [U]              Device Capabilities
[ 1806.181369] [U]      Device Caps      : 0x04208000
[ 1806.622899] [U]              Video Memory-to-Memory
[ 1807.057208] [U]              Streaming
[ 1807.483866] [U]              Extended Pix Format
[ 1807.907678] [U] Required ioctls:
[ 1808.325287] [U]      test VIDIOC_QUERYCAP: OK
[ 1808.785260] [U]      test invalid ioctls: OK
[ 1809.199015] [U] Allow for multiple opens:
[ 1809.613894] [U]      test second /dev/video0 open: OK
[ 1810.416746] [U]      test VIDIOC_QUERYCAP: OK
[ 1810.827974] [U]      test VIDIOC_G/S_PRIORITY: OK
[ 1811.466506] [U]      test for unlimited opens: OK
[ 1811.868388] [U] Debug ioctls:
[ 1812.257689] [U]      test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
[ 1813.034108] [U]      test VIDIOC_LOG_STATUS: OK (Not Supported)
[ 1813.807583] [U] Input ioctls:
[ 1814.192271] [U]      test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
[ 1814.958053] [U]      test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
[ 1815.721424] [U]      test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
[ 1816.486425] [U]      test VIDIOC_ENUMAUDIO: OK (Not Supported)
[ 1817.253873] [U]      test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
[ 1818.021773] [U]      test VIDIOC_G/S_AUDIO: OK (Not Supported)
[ 1818.783542] [U]      Inputs: 0 Audio Inputs: 0 Tuners: 0
[ 1819.170414] [U] Output ioctls:
[ 1819.549601] [U]      test VIDIOC_G/S_MODULATOR: OK (Not Supported)
[ 1820.306132] [U]      test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
[ 1821.085495] [U]      test VIDIOC_ENUMAUDOUT: OK (Not Supported)
[ 1821.883894] [U]      test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
[ 1822.698269] [U]      test VIDIOC_G/S_AUDOUT: OK (Not Supported)
[ 1823.541345] [U]      Outputs: 0 Audio Outputs: 0 Modulators: 0
[ 1824.391635] [U] Input/Output configuration ioctls:
[ 1824.830293] [U]      test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
[ 1825.708848] [U]      test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
[ 1826.608994] [U]      test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
[ 1827.520616] [U]      test VIDIOC_G/S_EDID: OK (Not Supported)
[ 1828.438211] [U] Control ioctls:
[ 1828.926449] [U]      test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
[ 1829.856497] [U]      test VIDIOC_QUERYCTRL: OK
[ 1830.335647] [U]      test VIDIOC_G/S_CTRL: OK
[ 1830.816513] [U]      test VIDIOC_G/S/TRY_EXT_CTRLS: OK
[ 1831.740067] [U]      test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
[ 1832.666736] [U]      test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
[ 1833.597005] [U]      Standard Controls: 3 Private Controls: 0
[ 1834.070452] [U] Format ioctls:
[ 1834.540460] [U]      test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
[ 1835.473065] [U]      test VIDIOC_G/S_PARM: OK (Not Supported)
[ 1836.395238] [U]      test VIDIOC_G_FBUF: OK (Not Supported)
[ 1837.322128] [U]      test VIDIOC_G_FMT: OK
[ 1837.798880] [U]      test VIDIOC_TRY_FMT: OK
[ 1838.267574] [U]      test VIDIOC_S_FMT: OK
[ 1838.724264] [U]      test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
[ 1839.627408] [U]      test Cropping: OK (Not Supported)
[ 1840.526875] [U]      test Composing: OK (Not Supported)
[ 1841.428562] [U]      test Scaling: OK
[ 1841.882087] [U] Codec ioctls:
[ 1842.331672] [U]      test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
[ 1843.221419] [U]      test VIDIOC_G_ENC_INDEX: OK (Not Supported)
[ 1844.105854] [U]      test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
[ 1844.993986] [U] Buffer ioctls:
[ 1845.558827] [U]      test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
[ 1846.486226] [U]      test VIDIOC_EXPBUF: OK
[ 1846.936148] [U]      test Requests: OK (Not Supported)
[ 1847.805687] [U]      test TIME32/64: OK
[ 1848.255712] [U] Test input 0:
[ 1848.685591] [U] Stream using all formats:
[ 1853.598085] [U]      BA24 (32-bit ARGB 8-8-8-8) 1x1 -> BA24 (32-bit ARGB 8-8-8-8) 1x1: OK
[ 1858.085109] [U]      BA24 (32-bit ARGB 8-8-8-8) 1x1 -> RGB3 (24-bit RGB 8-8-8) 1x1: OK
[ 1861.799188] [U]      BA24 (32-bit ARGB 8-8-8-8) 1x1 -> RGBP (16-bit RGB 5-6-5) 1x1: OK
[ 1864.859534] [U]      BA24 (32-bit ARGB 8-8-8-8) 1x1 -> AR15 (16-bit ARGB 1-5-5-5) 1x1: OK
[ 1867.974755] [U]      BA24 (32-bit ARGB 8-8-8-8) 1x1 -> AR12 (16-bit ARGB 4-4-4-4) 1x1: OK
[ 1868.466365] stm-dma2d 4002b000.dma2d: dma alloc of size 4294643712 failed
[ 1868.971398] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[ 1869.487572] [U]      BA24 (32-bit ARGB 8-8-8-8) 16383x65535 -> BA24 (32-bit ARGB 8-8-8-8) 16383x65535: FAIL
[ 1870.017197] stm-dma2d 4002b000.dma2d: dma alloc of size 4294643712 failed
[ 1870.562272] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[ 1871.147644] [U]      BA24 (32-bit ARGB 8-8-8-8) 16383x65535 -> RGB3 (24-bit RGB 8-8-8) 16383x65535: FAIL
[ 1871.780530] stm-dma2d 4002b000.dma2d: dma alloc of size 4294643712 failed
[ 1872.431797] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[ 1873.112100] [U]      BA24 (32-bit ARGB 8-8-8-8) 16383x65535 -> RGBP (16-bit RGB 5-6-5) 16383x65535: FAIL
[ 1873.805156] stm-dma2d 4002b000.dma2d: dma alloc of size 4294643712 failed
[ 1874.492353] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[ 1875.221576] [U]      BA24 (32-bit ARGB 8-8-8-8) 16383x65535 -> AR15 (16-bit ARGB 1-5-5-5) 16383x65535: FAIL
[ 1876.000283] stm-dma2d 4002b000.dma2d: dma alloc of size 4294643712 failed
[ 1876.808963] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[ 1877.634785] [U]      BA24 (32-bit ARGB 8-8-8-8) 16383x65535 -> AR12 (16-bit ARGB 4-4-4-4) 16383x65535: FAIL
[ 1883.283141] [U]      BA24 (32-bit ARGB 8-8-8-8) 240x320 -> BA24 (32-bit ARGB 8-8-8-8) 240x320: OK
[ 1888.533587] [U]      BA24 (32-bit ARGB 8-8-8-8) 240x320 -> RGB3 (24-bit RGB 8-8-8) 240x320: OK
[ 1892.729322] [U]      BA24 (32-bit ARGB 8-8-8-8) 240x320 -> RGBP (16-bit RGB 5-6-5) 240x320: OK
[ 1896.013783] [U]      BA24 (32-bit ARGB 8-8-8-8) 240x320 -> AR15 (16-bit ARGB 1-5-5-5) 240x320: OK
[ 1899.195802] [U]      BA24 (32-bit ARGB 8-8-8-8) 240x320 -> AR12 (16-bit ARGB 4-4-4-4) 240x320: OK
[ 1902.318853] [U]      RGB3 (24-bit RGB 8-8-8) 1x1 -> BA24 (32-bit ARGB 8-8-8-8) 1x1: OK
[ 1905.399663] [U]      RGB3 (24-bit RGB 8-8-8) 1x1 -> RGB3 (24-bit RGB 8-8-8) 1x1: OK
[ 1908.515463] [U]      RGB3 (24-bit RGB 8-8-8) 1x1 -> RGBP (16-bit RGB 5-6-5) 1x1: OK
[ 1911.589775] [U]      RGB3 (24-bit RGB 8-8-8) 1x1 -> AR15 (16-bit ARGB 1-5-5-5) 1x1: OK
[ 1914.682147] [U]      RGB3 (24-bit RGB 8-8-8) 1x1 -> AR12 (16-bit ARGB 4-4-4-4) 1x1: OK
[ 1915.169478] stm-dma2d 4002b000.dma2d: dma alloc of size 3220983808 failed
[ 1915.671278] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[ 1916.184281] [U]      RGB3 (24-bit RGB 8-8-8) 16383x65535 -> BA24 (32-bit ARGB 8-8-8-8) 16383x65535: FAIL
[ 1916.709840] stm-dma2d 4002b000.dma2d: dma alloc of size 3220983808 failed
[ 1917.252352] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[ 1917.834611] [U]      RGB3 (24-bit RGB 8-8-8) 16383x65535 -> RGB3 (24-bit RGB 8-8-8) 16383x65535: FAIL
[ 1918.463784] stm-dma2d 4002b000.dma2d: dma alloc of size 3220983808 failed
[ 1919.114290] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[ 1919.789982] [U]      RGB3 (24-bit RGB 8-8-8) 16383x65535 -> RGBP (16-bit RGB 5-6-5) 16383x65535: FAIL
[ 1920.479624] stm-dma2d 4002b000.dma2d: dma alloc of size 3220983808 failed
[ 1921.165202] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[ 1921.893374] [U]      RGB3 (24-bit RGB 8-8-8) 16383x65535 -> AR15 (16-bit ARGB 1-5-5-5) 16383x65535: FAIL
[ 1922.668057] stm-dma2d 4002b000.dma2d: dma alloc of size 3220983808 failed
[ 1923.469342] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[ 1924.297500] [U]      RGB3 (24-bit RGB 8-8-8) 16383x65535 -> AR12 (16-bit ARGB 4-4-4-4) 16383x65535: FAIL
[ 1929.890593] [U]      RGB3 (24-bit RGB 8-8-8) 240x320 -> BA24 (32-bit ARGB 8-8-8-8) 240x320: OK
[ 1935.098497] [U]      RGB3 (24-bit RGB 8-8-8) 240x320 -> RGB3 (24-bit RGB 8-8-8) 240x320: OK
[ 1939.250033] [U]      RGB3 (24-bit RGB 8-8-8) 240x320 -> RGBP (16-bit RGB 5-6-5) 240x320: OK
[ 1942.503854] [U]      RGB3 (24-bit RGB 8-8-8) 240x320 -> AR15 (16-bit ARGB 1-5-5-5) 240x320: OK
[ 1945.659254] [U]      RGB3 (24-bit RGB 8-8-8) 240x320 -> AR12 (16-bit ARGB 4-4-4-4) 240x320: OK
[ 1948.763903] [U]      RGBP (16-bit RGB 5-6-5) 1x1 -> BA24 (32-bit ARGB 8-8-8-8) 1x1: OK
[ 1951.832407] [U]      RGBP (16-bit RGB 5-6-5) 1x1 -> RGB3 (24-bit RGB 8-8-8) 1x1: OK
[ 1954.927592] [U]      RGBP (16-bit RGB 5-6-5) 1x1 -> RGBP (16-bit RGB 5-6-5) 1x1: OK
[ 1957.991536] [U]      RGBP (16-bit RGB 5-6-5) 1x1 -> AR15 (16-bit ARGB 1-5-5-5) 1x1: OK
[ 1961.086603] [U]      RGBP (16-bit RGB 5-6-5) 1x1 -> AR12 (16-bit ARGB 4-4-4-4) 1x1: OK
[ 1961.575893] stm-dma2d 4002b000.dma2d: dma alloc of size 2147323904 failed
[ 1962.079572] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[ 1962.594354] [U]      RGBP (16-bit RGB 5-6-5) 16383x65535 -> BA24 (32-bit ARGB 8-8-8-8) 16383x65535: FAIL
[ 1963.121249] stm-dma2d 4002b000.dma2d: dma alloc of size 2147323904 failed
[ 1963.665788] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[ 1964.249129] [U]      RGBP (16-bit RGB 5-6-5) 16383x65535 -> RGB3 (24-bit RGB 8-8-8) 16383x65535: FAIL
[ 1964.880104] stm-dma2d 4002b000.dma2d: dma alloc of size 2147323904 failed
[ 1965.530670] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[ 1966.210598] [U]      RGBP (16-bit RGB 5-6-5) 16383x65535 -> RGBP (16-bit RGB 5-6-5) 16383x65535: FAIL
[ 1966.902316] stm-dma2d 4002b000.dma2d: dma alloc of size 2147323904 failed
[ 1967.590215] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[ 1968.319871] [U]      RGBP (16-bit RGB 5-6-5) 16383x65535 -> AR15 (16-bit ARGB 1-5-5-5) 16383x65535: FAIL
[ 1969.097012] stm-dma2d 4002b000.dma2d: dma alloc of size 2147323904 failed
[ 1969.900036] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[ 1970.729920] [U]      RGBP (16-bit RGB 5-6-5) 16383x65535 -> AR12 (16-bit ARGB 4-4-4-4) 16383x65535: FAIL
[ 1976.318963] [U]      RGBP (16-bit RGB 5-6-5) 240x320 -> BA24 (32-bit ARGB 8-8-8-8) 240x320: OK
[ 1981.494224] [U]      RGBP (16-bit RGB 5-6-5) 240x320 -> RGB3 (24-bit RGB 8-8-8) 240x320: OK
[ 1985.599406] [U]      RGBP (16-bit RGB 5-6-5) 240x320 -> RGBP (16-bit RGB 5-6-5) 240x320: OK
[ 1988.829141] [U]      RGBP (16-bit RGB 5-6-5) 240x320 -> AR15 (16-bit ARGB 1-5-5-5) 240x320: OK
[ 1991.998991] [U]      RGBP (16-bit RGB 5-6-5) 240x320 -> AR12 (16-bit ARGB 4-4-4-4) 240x320: OK
[ 1995.084529] [U]      AR15 (16-bit ARGB 1-5-5-5) 1x1 -> BA24 (32-bit ARGB 8-8-8-8) 1x1: OK
[ 1998.191853] [U]      AR15 (16-bit ARGB 1-5-5-5) 1x1 -> RGB3 (24-bit RGB 8-8-8) 1x1: OK
[ 2001.307217] [U]      AR15 (16-bit ARGB 1-5-5-5) 1x1 -> RGBP (16-bit RGB 5-6-5) 1x1: OK
[ 2004.413725] [U]      AR15 (16-bit ARGB 1-5-5-5) 1x1 -> AR15 (16-bit ARGB 1-5-5-5) 1x1: OK
[ 2007.527437] [U]      AR15 (16-bit ARGB 1-5-5-5) 1x1 -> AR12 (16-bit ARGB 4-4-4-4) 1x1: OK
[ 2008.016277] stm-dma2d 4002b000.dma2d: dma alloc of size 2147323904 failed
[ 2008.523318] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[ 2009.038828] [U]      AR15 (16-bit ARGB 1-5-5-5) 16383x65535 -> BA24 (32-bit ARGB 8-8-8-8) 16383x65535: FAIL
[ 2009.567269] stm-dma2d 4002b000.dma2d: dma alloc of size 2147323904 failed
[ 2010.112209] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[ 2010.697226] [U]      AR15 (16-bit ARGB 1-5-5-5) 16383x65535 -> RGB3 (24-bit RGB 8-8-8) 16383x65535: FAIL
[ 2011.329552] stm-dma2d 4002b000.dma2d: dma alloc of size 2147323904 failed
[ 2011.979307] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[ 2012.658449] [U]      AR15 (16-bit ARGB 1-5-5-5) 16383x65535 -> RGBP (16-bit RGB 5-6-5) 16383x65535: FAIL
[ 2013.350104] stm-dma2d 4002b000.dma2d: dma alloc of size 2147323904 failed
[ 2014.035612] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[ 2014.762649] [U]      AR15 (16-bit ARGB 1-5-5-5) 16383x65535 -> AR15 (16-bit ARGB 1-5-5-5) 16383x65535: FAIL
[ 2015.538183] stm-dma2d 4002b000.dma2d: dma alloc of size 2147323904 failed
[ 2016.338784] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[ 2017.166692] [U]      AR15 (16-bit ARGB 1-5-5-5) 16383x65535 -> AR12 (16-bit ARGB 4-4-4-4) 16383x65535: FAIL
[ 2022.744387] [U]      AR15 (16-bit ARGB 1-5-5-5) 240x320 -> BA24 (32-bit ARGB 8-8-8-8) 240x320: OK
[ 2027.927575] [U]      AR15 (16-bit ARGB 1-5-5-5) 240x320 -> RGB3 (24-bit RGB 8-8-8) 240x320: OK
[ 2032.066337] [U]      AR15 (16-bit ARGB 1-5-5-5) 240x320 -> RGBP (16-bit RGB 5-6-5) 240x320: OK
[ 2035.295351] [U]      AR15 (16-bit ARGB 1-5-5-5) 240x320 -> AR15 (16-bit ARGB 1-5-5-5) 240x320: OK
[ 2038.476408] [U]      AR15 (16-bit ARGB 1-5-5-5) 240x320 -> AR12 (16-bit ARGB 4-4-4-4) 240x320: OK
[ 2041.591223] [U]      AR12 (16-bit ARGB 4-4-4-4) 1x1 -> BA24 (32-bit ARGB 8-8-8-8) 1x1: OK
[ 2044.678274] [U]      AR12 (16-bit ARGB 4-4-4-4) 1x1 -> RGB3 (24-bit RGB 8-8-8) 1x1: OK
[ 2047.774851] [U]      AR12 (16-bit ARGB 4-4-4-4) 1x1 -> RGBP (16-bit RGB 5-6-5) 1x1: OK
[ 2050.849788] [U]      AR12 (16-bit ARGB 4-4-4-4) 1x1 -> AR15 (16-bit ARGB 1-5-5-5) 1x1: OK
[ 2053.955560] [U]      AR12 (16-bit ARGB 4-4-4-4) 1x1 -> AR12 (16-bit ARGB 4-4-4-4) 1x1: OK
[ 2054.446212] stm-dma2d 4002b000.dma2d: dma alloc of size 2147323904 failed
[ 2054.951517] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[ 2055.467584] [U]      AR12 (16-bit ARGB 4-4-4-4) 16383x65535 -> BA24 (32-bit ARGB 8-8-8-8) 16383x65535: FAIL
[ 2055.997127] stm-dma2d 4002b000.dma2d: dma alloc of size 2147323904 failed
[ 2056.543193] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[ 2057.128457] [U]      AR12 (16-bit ARGB 4-4-4-4) 16383x65535 -> RGB3 (24-bit RGB 8-8-8) 16383x65535: FAIL
[ 2057.761407] stm-dma2d 4002b000.dma2d: dma alloc of size 2147323904 failed
[ 2058.413191] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[ 2059.093749] [U]      AR12 (16-bit ARGB 4-4-4-4) 16383x65535 -> RGBP (16-bit RGB 5-6-5) 16383x65535: FAIL
[ 2059.786201] stm-dma2d 4002b000.dma2d: dma alloc of size 2147323904 failed
[ 2060.472393] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[ 2061.200709] [U]      AR12 (16-bit ARGB 4-4-4-4) 16383x65535 -> AR15 (16-bit ARGB 1-5-5-5) 16383x65535: FAIL
[ 2061.977728] stm-dma2d 4002b000.dma2d: dma alloc of size 2147323904 failed
[ 2062.780816] [U]              fail: v4l2-test-buffers.cpp(1349): q.reqbufs(node, 2)
[ 2063.610351] [U]      AR12 (16-bit ARGB 4-4-4-4) 16383x65535 -> AR12 (16-bit ARGB 4-4-4-4) 16383x65535: FAIL
[ 2069.207680] [U]      AR12 (16-bit ARGB 4-4-4-4) 240x320 -> BA24 (32-bit ARGB 8-8-8-8) 240x320: OK
[ 2074.392036] [U]      AR12 (16-bit ARGB 4-4-4-4) 240x320 -> RGB3 (24-bit RGB 8-8-8) 240x320: OK
[ 2078.538621] [U]      AR12 (16-bit ARGB 4-4-4-4) 240x320 -> RGBP (16-bit RGB 5-6-5) 240x320: OK
[ 2081.749134] [U]      AR12 (16-bit ARGB 4-4-4-4) 240x320 -> AR15 (16-bit ARGB 1-5-5-5) 240x320: OK
[ 2084.922145] [U]      AR12 (16-bit ARGB 4-4-4-4) 240x320 -> AR12 (16-bit ARGB 4-4-4-4) 240x320: OK
[ 2085.416538] [U] Total for stm-dma2d device /dev/video0: 121, Succeeded: 96, Failed: 25, Warnings: 0
*** BLURB HERE ***

Dillon Min (10):
  media: admin-guide: add stm32-dma2d description
  media: dt-bindings: media: add document for STM32 DMA2d bindings
  ARM: dts: stm32: Add DMA2D support for STM32F429 series soc
  ARM: dts: stm32: Enable DMA2D on STM32F469-DISCO board
  media: v4l2-mem2mem: add v4l2_m2m_get_unmapped_area for no-mmu
    platform
  media: videobuf2: Fix the size printk format
  media: v4l2-ctrls: Add V4L2_CID_COLORFX_CBCR max setting
  media: v4l2-ctrls: Add RGB color effects control
  clk: stm32: Fix ltdc's clock turn off by clk_disable_unused() after
    system enter shell
  media: stm32-dma2d: STM32 DMA2D driver

 .../admin-guide/media/platform-cardlist.rst        |   1 +
 .../devicetree/bindings/media/st,stm32-dma2d.yaml  |  71 ++
 Documentation/userspace-api/media/v4l/control.rst  |   9 +
 arch/arm/boot/dts/stm32f429.dtsi                   |  10 +
 arch/arm/boot/dts/stm32f469-disco.dts              |   4 +
 drivers/clk/clk-stm32f4.c                          |   4 -
 .../media/common/videobuf2/videobuf2-dma-contig.c  |   4 +-
 drivers/media/platform/Kconfig                     |  11 +
 drivers/media/platform/Makefile                    |   1 +
 drivers/media/platform/stm32/Makefile              |   2 +
 drivers/media/platform/stm32/dma2d/dma2d-hw.c      | 143 ++++
 drivers/media/platform/stm32/dma2d/dma2d-regs.h    | 113 ++++
 drivers/media/platform/stm32/dma2d/dma2d.c         | 739 +++++++++++++++++++++
 drivers/media/platform/stm32/dma2d/dma2d.h         | 135 ++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c          |  12 +-
 drivers/media/v4l2-core/v4l2-mem2mem.c             |  21 +
 include/media/v4l2-mem2mem.h                       |   5 +
 include/uapi/linux/v4l2-controls.h                 |   4 +-
 18 files changed, 1280 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/st,stm32-dma2d.yaml
 create mode 100644 drivers/media/platform/stm32/dma2d/dma2d-hw.c
 create mode 100644 drivers/media/platform/stm32/dma2d/dma2d-regs.h
 create mode 100644 drivers/media/platform/stm32/dma2d/dma2d.c
 create mode 100644 drivers/media/platform/stm32/dma2d/dma2d.h

-- 
2.7.4

